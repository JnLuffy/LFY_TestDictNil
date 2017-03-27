//
//  UIViewController+FlyElephant.m
//  LFY_TestDictNil
//
//  Created by administrator on 2017/3/27.
//  Copyright © 2017年 Dareway Software Co., Ltd. All rights reserved.
//
#import <objc/runtime.h>

#import "UIViewController+FlyElephant.h"

@implementation UIViewController (FlyElephant)
-(void)load1{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(fe_viewWillApper:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)fe_viewWillApper:(BOOL)animated{
    NSLog(@"FlyElephant--fe_viewWillApper");
}
@end
