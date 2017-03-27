//
//  ViewController.m
//  LFY_TestDictNil
//
//  Created by administrator on 2017/3/23.
//  Copyright © 2017年 Dareway Software Co., Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    [dict setObject:@"xiaoming" forKey:@"name"];
//    [dict setObject:@"errorcode" forKey:@"errorcode"];
//    [dict objectForKey:@""];
    NSDictionary *dict = @{@"zs":@"zhaosi",@"errorcode":@"zhangsan",@"ls":@"lisi",@"bz":@"banzhang"};

    
//    NSLog(@"errorcode= %@",[dict errorCodeForKey:@"errorCode"]);
        NSLog(@"errorcode= %@",[dict objectForKey:@"errorCode"]);
    NSLog(@"errorcode= %@",[dict objectForKey:@"ls"]);

     NSLog(@"arr3的真实类型: %@",[dict class]);
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 40, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+(NSDictionary *)errorKeyDic:(NSDictionary *)myDic

{
    
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [NSMutableDictionary dictionaryWithDictionary:myDic];

    if([keyArr containsObject:@"errorcode"]){
         [resDic setObject:[myDic objectForKey:@"errorcode"] forKey:@"errorCode"];
    }else  if([keyArr containsObject:@"errorCode"]){
        [resDic setObject:[myDic objectForKey:@"errorCode"] forKey:@"errorcode"];
    }
    
    if([keyArr containsObject:@"errortext"]){
        [resDic setObject:[myDic objectForKey:@"errortext"] forKey:@"errorText"];
    }else  if([keyArr containsObject:@"errorText"]){
        [resDic setObject:[myDic objectForKey:@"errorText"] forKey:@"errortext"];
    }
     return resDic;
}

@end
