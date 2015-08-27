//
//  XGFMItem.h
//  XGFMDBManagers
//
//  Created by 赵小嘎 on 15/8/28.
//  Copyright (c) 2015年 XG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XGKeyValueItem.h"
@interface XGFMItem : XGKeyValueItem



//数据库存储的二进制
@property (strong, nonatomic) NSData * itemObject;
//数据库存储的 模型数据
@property (nonatomic,strong) id dicModel;

@end
