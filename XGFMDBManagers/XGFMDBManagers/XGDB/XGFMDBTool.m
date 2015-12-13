//
//  XGFMDBTool.m
//  XGFMDBManagers
//
//  Created by XG on 15/8/12.
//  Copyright (c) 2015年 XG. All rights reserved.
//

#import "XGFMDBTool.h"
#import "XGKeyValueStore.h"

//默认数据库名称
static NSString *const DEFAULT_XG_DB_NAME = @"XGFMDBStore.sqlite";
//TODO : 可以在此处修改 默认库名称



@interface XGFMDBTool ()

@property (nonatomic,strong) XGKeyValueStore * storeManger;

@end

@implementation XGFMDBTool


static XGFMDBTool *sharedFMDBManager = nil;
+(XGFMDBTool *)sharedFMDBManager
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        sharedFMDBManager =[[XGFMDBTool alloc] init];
    });
    return sharedFMDBManager;
}

- (void)createCustomDBWithName:(NSString *)tableName;
{
    if (tableName.length) {
        _storeManger = [[XGKeyValueStore alloc] initDBWithName:tableName];
    } else {
        _storeManger = [[XGKeyValueStore alloc]
                        initDBWithName:
                        DEFAULT_XG_DB_NAME];
    }
}


- (XGKeyValueStore *)storeManger
{
    if (_storeManger == nil) {
        _storeManger = [[XGKeyValueStore alloc]initDBWithName:DEFAULT_XG_DB_NAME];
        [_storeManger createCustomTableWithName:DEFAULT_XG_TABLE_NAME];
    }
    return _storeManger;
}

- (void)createTableWithName:(NSString *)tableName
{
    [self.storeManger createCustomTableWithName:tableName];
}

//  new
- (void)createTableWithName:(NSString *)tableName withobjArray:(NSArray *)objArray
{
    [self.storeManger createCustomTableWithName:tableName];
}

- (NSString *)getReturnTableName:(NSString *)tableName
{
    if (tableName == nil) {
        tableName = DEFAULT_XG_TABLE_NAME;
    }
    [self createTableWithName:tableName];
    return tableName;
}


//-----------------------------------------------------------------------增


/**
 *  插入一条数据
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
{
    if (objectId == nil) return ;
    
    [self.storeManger insertwithId:objectId
                            Object:obj
                              type:type
                          position:position
                         intoTable:[self getReturnTableName:fromTable]
                          maxCount:0];
}


- (void)insertDBwithId:(NSString *)objectId
                  type:(NSString *)type
              position:(NSString *)position
            WithObject:(id)obj
             fromTable:(NSString *)fromTable
              maxCount:(int)maxCount
                 text1:(NSString *)text1
                 text2:(NSString *)text2
                 text3:(NSString *)text3;
{
    if (objectId == nil) return ;
    [self.storeManger insertwithId:objectId
                            Object:obj
                              type:type
                          position:position
                         intoTable:[self getReturnTableName:fromTable]
                          maxCount:maxCount
                             text1:text1
                             text2:text2
                             text3:text3];
}
/**
 *  插入一条数据
 *
 *  @param objectId  id
 *  @param obj       数据 本身的json
 *  @param fromTable 表格名
 */
- (void)insertDBwithId:(NSString *)objectId
                  type:(NSString *)type
              position:(NSString *)position
            WithObject:(id)obj
              maxCount:(int)maxCount
             fromTable:(NSString *)fromTable;
{
    if (objectId == nil) return ;
    
    [self.storeManger insertwithId:objectId
                            Object:obj
                              type:type
                          position:position
                         intoTable:[self getReturnTableName:fromTable]
                         maxCount:maxCount];
}

- (void)insterObjArrayWithId:(NSArray *)idArray
             WithObjectArray:(NSArray *)objArray
                   typeArray:(NSArray *)typeArray
               positionArray:(NSArray *)positionArray
                    maxCount:(int)maxCount
                   fromTable:(NSString *)fromTable;
{
    if (idArray.count != objArray.count) return;
    
    for (int i = 0; i <idArray.count; i++) {
        if ([idArray objectAtIndex:i] == nil) return;
        
        [self.storeManger insertwithId:[idArray objectAtIndex:i]
                                Object:[objArray objectAtIndex:i]
                                  type:[typeArray objectAtIndex:i]
                              position:[positionArray objectAtIndex:i]
                             intoTable:[self getReturnTableName:fromTable]
                              maxCount:maxCount];
    }
    
}
//------------------------------------------------------------------------删
/**
 *  通过某条 id 删除本条数据
 *
 *  @param objectId  objectID
 *  @param tableName 表格名
 */
- (void)deleteObjById:(NSString *)objectId fromTable:(NSString *)tableName;
{
    if (objectId == nil) return ;
    
    [self.storeManger deleteObjectById:objectId fromTable:tableName];
}
/**
 *  通过 id数组 来删除 id相 对应的数据
 *
 *  @param objectIdArray id Array
 *  @param tableName     数据库表格
 */
- (void)deleteObjByIdArray:(NSArray *)objectIdArray fromTable:(NSString *)tableName;
{
    [self.storeManger deleteObjectsByIdArray:objectIdArray fromTable:tableName];
}
/**
 *  删除本表的所有数据  慎用 (清楚缓存时用到)
 *
 *  @param tableName 表名
 */
- (void)deleteAllObjfromTable:(NSString *)tableName;
{
    [self.storeManger clearTable:tableName];
}

/**
 *  通过 自定义条件筛选数据 然后删除
 *
 *  @param condition 类似于 "id＝xx and name=xx"
 *  @param tableName     数据库表格
 */
- (void)deleteObjByCondition:(NSString *)condition fromTable:(NSString *)tableName{
    [self.storeManger deleteObjByCondition:condition fromTable:tableName];
}

//--------------------------------------------------------------------------改

/**
 *  通过objectID修改这条数据 (覆盖之前的数据)
 *
 *  @param objectId  objectId
 *  @param obj       json数据
 *  @param fromTable 表格名
 */
- (void)updateDbById:(NSString *)objectId
                type:(NSString *)type
            position:(NSString *)position
          WithObject:(id)obj
           fromTable:(NSString *)fromTable;
{
    if (objectId == nil) return ;
    
    [self.storeManger updateWithId:objectId
                            Object:obj
                              type:type
                          position:position
                         intoTable:fromTable];
}


- (void)updateDbByIdArray:(NSArray *)IdArray
          WithObjectArray:(NSArray *)objArray
                fromTable:(NSString *)fromTable;
{
    if (IdArray.count != objArray.count) return;
    
    for (int i = 0; i <IdArray.count; i ++) {
        if ([IdArray objectAtIndex:i] == nil) return;
        //        if ([objArray objectAtIndex:i] == nil) return;
        
//        [self updateDbById:[IdArray objectAtIndex:i]
//              WithObject:[objArray objectAtIndex:i] fromTable:fromTable];
    }
    
}

//--------------------------------------------------------------------------查
/**
 *  通过 objectID 查询 获取这条数据
 *
 *  @param objectId  objectID
 *  @param ClassName 需要转换成什么模型   如果这个参数是nil 返回的是 存的字典
 *  @param tableName 表格名
 *  如果单条数据就用ClassName 接收模型
 *
 *  @return 返回 模型
 */
- (id)getDBObjectById:(NSString *)objectId fromTable:(NSString *)tableName;
{
    if (objectId == nil) return nil;
    
    id  item = [self.storeManger getobjById:objectId fromTable:tableName];
    if (item) {
        return item;
    }
    return nil;
}

- (NSArray *)getObjectByType:(NSString *)type fromTable:(NSString *)tableName;
{
    if (type == nil) return nil;
    return [self.storeManger getObjItemWithSearchCondition:updateType
                                                     Count:0
                                                 fromTable:tableName];
}


/**
 *  根据某条数据id 获取之前10条的数据 (用于上拉刷新)(倒序 时间早的在后面)
 *
 *  @param objectId  上拉刷新最后一条id
 *  @param tableName 表格名
 *
 *  @return 返回数组 (后10条数据 数组)
 */
- (NSArray *)getLastTenDBObjectById:(NSString *)objectId fromTable:(NSString *)tableName;
{
    if (objectId == nil || [objectId isEqualToString:@"(null)"]){
        return [self.storeManger getAllItemsFromTable:tableName];
    }else{
        return  [self.storeManger getObjItemsWithobjId:objectId
                                                 Count:10
                                             fromTable:tableName];
    }
    return nil;
    
}

- (NSArray *)getNewTenObjectById:(NSString *)objectId
                       fromTable:(NSString *)tableName;
{
    
    if (objectId == nil || [objectId isEqualToString:@"(null)"]) {
        return nil;
    } else {
        return [self.storeManger getNewObjItemsWithobjId:objectId
                                                   Count:10
                                               fromTable:tableName];
    }
    
    return nil;
}



- (NSArray *)getNewTenObjectByCondition:(NSString *)condition
                              fromTable:(NSString *)tableName{
    return [self.storeManger getObjItemWithSearchCondition:condition
                                                     Count:100
                                                 fromTable:tableName];
}

/**
 *  获取这个表格的所有数据
 *
 *  @param fromTable  数据表
 *
 *  @return 所有数据
 */
- (NSArray *) getAllObjsFromTable:(NSString *)fromTable;
{
    return [self.storeManger getAllItemsFromTable:fromTable];
}

- (NSMutableArray *)getAllObjsOnlyResultFromTable:(NSString *)fromTable
{
    NSArray * allObjArray = [self getAllObjsFromTable:fromTable];
    NSMutableArray * relustArray = [NSMutableArray array];
    for (XGKeyValueItem * item  in allObjArray) {
        [relustArray addObject:item.itemResult];
    }
    if (relustArray) {
        return relustArray;
    }else{
        return nil;
    }
}

- (id)getLastObjFromTable:(NSString *)fromTable;
{
    NSArray * myArray = [self getObjWithCount:1 fromTable:fromTable];
    
    if (myArray.count) {
        return [myArray objectAtIndex:0];
    }else{
        return nil;
    }
    return nil;
}

- (NSArray * )getObjWithCount:(int)count fromTable:(NSString *)fromTable
{
    NSArray * array = [self.storeManger getAnyCount:count fromTable:fromTable];
    if (array.count) {
        return array;
    }else{
        return nil;
    }
}


- (NSArray *)getObjWithCount:(int)count
                   fromTable:(NSString *)fromTable
                      descBy:(NSString *)columnName
{
    NSArray *array = [self.storeManger getAnyCount:count
                                         fromTable:fromTable
                                            descBy:columnName];
    if (array.count) {
        return array;
    } else {
        return nil;
    }
}



- (NSMutableArray *)getObjOnlyResultWithCount:(int)count fromTable:(NSString *)fromTable;
{
    NSMutableArray * muArray = [NSMutableArray array];
    NSArray *  array = [self getObjWithCount:count fromTable:fromTable];
    for (XGKeyValueItem * item in array) {
        [muArray addObject:item.itemResult];
    }
    if (array.count) {
        return muArray;
    }else{
        return nil;
    }
}

- (NSUInteger)getObjCountFromTable:(NSString *)fromTable;
{
    NSArray * array =[self getAllObjsFromTable:fromTable];
    return array.count;
}

@end
