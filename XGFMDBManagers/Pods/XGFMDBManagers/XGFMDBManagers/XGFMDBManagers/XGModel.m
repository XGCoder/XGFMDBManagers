//
//  XGModel.m
//  XGFMDBManagers
//
//  Created by XG on 15/8/15.
//  Copyright (c) 2015年 XG. All rights reserved.
//

#import "XGModel.h"
#import <MJExtension.h>
#import "MyModel.h"
@implementation XGModel
//MJCodingImplementation

+ (NSDictionary *)objectClassInArray
{
    return @{ @"modelArray": [MyModel class] };
}


@end
