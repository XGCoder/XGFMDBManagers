//
//  ViewController.m
//  XGFMDBManagers
//
//  Created by 赵小嘎 on 15/8/28.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "ViewController.h"
#import "XGFMDBTool.h"
#import "XGModel.h"
#import "MyModel.h"

#import "XGKeyValueItem.h"
@interface ViewController ()
//可以不用定义 这个属性 用单例 也是可以的
@property (nonatomic,strong) XGFMDBTool * tool;

@end

@implementation ViewController


- (XGFMDBTool *)tool
{
    if (_tool == nil) {
        _tool = [[XGFMDBTool alloc]init];
    }
    return _tool;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//        [self insert];
    //    [self deleteObjWithId:@"33"];
    //    [self.tool deleteAllObjfromTable:TEXT_XG_TABLE_NAME];
//        [self update];
//        [self getDBObjectById:@"34"];
//        [self getLastTenDBObjectById:@"50"];
//    [self getAllObjsFromTable];
    //    [self getObjeItemWithType:@"1111"];
}

- (void)insert
{
    NSArray * array = @[@"1111",
                        @"2222",
                        @"3333",
                        @"4444",
                        @"5555",
                        ];
    
    for (int i = 0;  i < 500; i ++) {
        NSString * objid = [NSString stringWithFormat:@"%d",i +1 ];
        NSDictionary * dic = @{
                               @"age":@"13",
                               @"heather1":@"123",
                               @"heather2":@"234",
                               @"heather3":@"345",
                               @"heather4":@{@"sdgds":@"dsggd"},
                               @"heather5":@"456",
                               @"heather6":@"567",
                               @"heather7":@"678",
                               @"heather8":@"789",
                               @"heather9":@"890",
                               @"heather10":@"012",
                               };
        
        
        XGModel *  model = [[XGModel alloc]init];
        model.str1 = @"dskjbjvd";
        model.age = 230;
        model.hight = @23;
        MyModel * mymodel = [[MyModel alloc]init];
        mymodel.haha = @"dfhdt";
        model.modelArray = [NSArray arrayWithObject:mymodel];
        
        NSString * type = [array objectAtIndex: (arc4random() % 4)];
        
        
        [self.tool insertDBwithId:objid type:type position:objid  WithObject:dic fromTable:DEFAULT_XG_TABLE_NAME];
    }
}

- (void)deleteObjWithId:(NSString *)str
{
    [self.tool deleteObjById:str fromTable:DEFAULT_XG_TABLE_NAME];
}

- (void)update{
    
    NSDictionary * dic = @{
                           @"qwwerewf":@"dsagdsgdsg"
                           };
    
    [self.tool updateDbById:@"34" type:nil position:nil  WithObject:dic fromTable:DEFAULT_XG_TABLE_NAME];
    
}

- (void)getDBObjectById:(NSString *)str
{
    XGKeyValueItem * str34 = (XGKeyValueItem *)[self.tool getDBObjectById:str fromTable:DEFAULT_XG_TABLE_NAME];
    
    NSLog(@" str34 = %@ ",str34);
}

- (void)getLastTenDBObjectById:(NSString *)str
{
    
    NSArray * ary =  [self.tool getLastTenDBObjectById:str fromTable:DEFAULT_XG_TABLE_NAME];
    NSLog(@"  %@  ",ary);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getAllObjsFromTable{//取出的 不是模型是数据
    NSArray * array = [self.tool getAllObjsOnlyResultFromTable:DEFAULT_XG_TABLE_NAME];
    NSLog(@"array %@",array);
}

- (void)getObjeItemWithType:(NSString *)type
{
    NSArray * array =  [self.tool getObjectByType:type fromTable:DEFAULT_XG_TABLE_NAME];
    NSLog(@" get with type array  %@",array);
}

/*
 我是测试数据我是测试数据我是测试数据我是测试数据我是测试数据我是测试数据我是测试数据
 
 */
@end
