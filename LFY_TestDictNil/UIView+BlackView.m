//
//  UIView+BlackView.m
//  LFY_TestDictNil
//
//  Created by administrator on 2017/3/27.
//  Copyright © 2017年 Dareway Software Co., Ltd. All rights reserved.
//

#import "UIView+BlackView.h"
/** 导入头文件 */
#import <objc/runtime.h>

@implementation UIView (BlackView)
-(void)load2{
    
    /** 获取原始setBackgroundColor方法 */
    Method originalM = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
    
    /** 获取自定义的pb_setBackgroundColor方法 */
    Method exchangeM = class_getInstanceMethod([self class], @selector(pb_setBackgroundColor:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

/** 自定义的方法 */
-(void)pb_setBackgroundColor:(UIColor *) color{
    
    NSLog(@"%s",__FUNCTION__);
    
    /**
     1.更改颜色
     2.所有继承自UIView的控件,设置背景色都会设置成自定义的'orangeColor'
     3. 此时调用的方法 'pb_setBackgroundColor' 相当于调用系统的 'setBackgroundColor' 方法,原因是在load方法中进行了方法交换.
     4. 注意:此处并没有递归操作.
     */
    [self pb_setBackgroundColor:[UIColor yellowColor]];
}
@end
