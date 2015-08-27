//
//  XGKeyValueItem.h
//  XGFMDBManagers
//
//  Created by 赵小嘎 on 15/8/19.
//  Copyright (c) 2015年 XG. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  从数据库获取数据的 结果模型
 */
@interface XGKeyValueItem : NSObject
@property (strong, nonatomic) NSString *itemId;
@property (strong, nonatomic) NSDate *createdTime;
@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * position;
@property (nonatomic, copy) NSString *text1;
@property (nonatomic, copy) NSString *text2;
@property (nonatomic, copy) NSString *text3;

/**
 *  从数据库读取的数据
 */
@property (nonatomic, strong) id itemResult;

@end
