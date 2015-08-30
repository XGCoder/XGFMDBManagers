//
//  XGFMDBTool.h
//  XGFMDBManagers
//
//  Created by XG on 15/8/12.
//  Copyright (c) 2015年 XG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XGKeyValueItem.h"
/*
 思路:
 
             这个数据库 思路 借鉴了 猿题库开源数据库https://github.com/yuantiku/YTKKeyValueStore Key  Value的思路
 
 遇到的问题:
 
             在使用时遇到查询某一类型的数据时 YTKKeyValueStore 数据表格 只留了 时间 和id 以供查询
             显而易见 这样的数据库结构极不方便条件查询
             在XGKeyValueStore中进行了 优化
 
 存储数据种类:
 
             XGKeyValueStore  只要给数据 就能存  (字典 模型 字符串等)任意存任意取 并且模型不用遵守NSCoding协议
 
 缺点:
 
             XGKeyValueStore 暂时支持  存的是什么东西  数据库返回的就是什么东西  不会对数据进行处理(如果存的是json 数据库不会处理)
 
 如何使用:
 
             使用 这个数据库需要依赖FMDB第三方库  并且引入XGDB文件夹 中的 几个类
             
             对外使用 只需用XGFMDBTool 就OK
             
             查询数据 返回的数据都是XGKeyValueItem 模型 其中的itemResult 就是所存储的数据

             id  pos 必传      pos(辅助主键) 可以读取数据时排序使用
 
 */


//默认表格名称
static NSString *const DEFAULT_XG_TABLE_NAME = @"default_database_table";

//默认 存储个数
static int  XG_DEFAUL_INSERT_COUNT = 50;


@interface XGFMDBTool : NSObject

+ (XGFMDBTool *)sharedFMDBManager;

//-----------------------------------------------------------------------增
/**
 *  插入一条数据  默认不限制
 *
 *  @param objectId  id
 *  @param obj       数据 本身的json
 *  @param fromTable 表格名
 */
- (void)insertDBwithId:(NSString *)objectId
                  type:(NSString *)type
              position:(NSString *)position
            WithObject:(id)obj
             fromTable:(NSString *)fromTable;
/**
 *  插入一条数据  可以限定数据个数
 *
 *  @param objectId  id
 *  @param obj       数据 本身的json
 *  @param maxCount  最多存入多少条数据
 *  @param fromTable 表格名
 */
- (void)insertDBwithId:(NSString *)objectId
                  type:(NSString *)type
              position:(NSString *)position
            WithObject:(id)obj
              maxCount:(int)maxCount
             fromTable:(NSString *)fromTable;

- (void)insertDBwithId:(NSString *)objectId
                  type:(NSString *)type
              position:(NSString *)position
            WithObject:(id)obj
             fromTable:(NSString *)fromTable
              maxCount:(int)maxCount
                 text1:(NSString *)text1
                 text2:(NSString *)text2
                 text3:(NSString *)text3;

/**
 *  批量插入 一组数据
 *
 *  @param idArray    id 数组
 *  @param objArray   与id 数组相对应的 obj数组
 *  @param tromeTable 表格名
 */
- (void)insterObjArrayWithId:(NSArray *)idArray
             WithObjectArray:(NSArray *)objArray
                   typeArray:(NSArray *)typeArray
               positionArray:(NSArray *)positionArray
                    maxCount:(int)maxCount
                   fromTable:(NSString *)fromTable;

//------------------------------------------------------------------------删
/**
 *  通过某条 id 删除本条数据
 *
 *  @param objectId  objectID
 *  @param tableName 表格名
 */
- (void)deleteObjById:(NSString *)objectId
            fromTable:(NSString *)tableName;

/**
 *  通过 id数组 来删除 id相 对应的数据
 *
 *  @param objectIdArray id Array 只是id数组就ok  不需要转NSString 数据库本身已经处理
 *  @param tableName     数据库表格
 */
- (void)deleteObjByIdArray:(NSArray *)objectIdArray
                 fromTable:(NSString *)tableName;

/**
 *  删除本表的所有数据  慎用 (清楚缓存时用到)
 *
 *  @param tableName 表名
 */
- (void)deleteAllObjfromTable:(NSString *)tableName;

//--------------------------------------------------------------------------改

/**
 *  通过objectID修改这条数据
 *
 *  @param objectId  objectId
 *  @param obj       json数据
 *  @param fromTable 表格名
 */
- (void)updateDbById:(NSString *)objectId
                type:(NSString *)type
            position:(NSString *)position
          WithObject:(id)obj fromTable:(NSString *)fromTable;



/**
 *   通过objectID数组修改 这些数据        暂时不对外
 *   id 数组里面的顺序  必须和 obj数组里面的数据 一一对应
 */
//- (void)updateDbByIdArray:(NSArray *)objectIdArray WithObjectArray:(NSArray *)objArray fromTable:(NSString *)fromTable;

//--------------------------------------------------------------------------查
/**
 *  通过 objectID 查询 获取这条数据
 *
 *  @param objectId  objectID
 *  @param tableName 表格名
 *
 *  @return 返回数据是json
 */
- (id)getDBObjectById:(NSString *)objectId
            fromTable:(NSString *)tableName;

/**
 *  通过type 筛选
 *  @return 筛选后排列 的数组
 */
- (NSArray *)getObjectByType:(NSString *)type
                   fromTable:(NSString *)tableName;


/**
 *  根据某条数据id 获取之前10条的数据 (用于上拉刷新)(倒序 时间早的在后面)
 *  (根据插入时间进行排序的  所以如果有顺序需求 尽量不要用这个方法) 后期会完善增加方法
 *
 *  @param objectId  上拉刷新最后一条id
 *  @param tableName 表格名
 *  @return 返回数组 (后10条数据 数组)数组 里面全是 XGKeyValueItem 模型
 */
- (NSArray *)getLastTenDBObjectById:(NSString *)objectId
                          fromTable:(NSString *)tableName;



/**
 *  获取这个表格的所有数据 (默认根据插入时间排序)
 *
 *  @param fromTable  数据表
 *
 *  @return 所有数据
 */
- (NSArray *) getAllObjsFromTable:(NSString *)fromTable;

/**
 *   获取这个表格的所有数据  根据传入数据库的pos 字段排序
 */
- (NSArray *) getAllObjsWithPositionFromTable:(NSString *)fromTable;



/**
 *  返回数据库中的最后一条数据
 */
- (id)getLastObjFromTable:(NSString *)fromeTable;

/**
 *  返回某个表格 一共多少条数据
 */
- (NSUInteger)getObjCountFromTable:(NSString *)fromTable;

@end
