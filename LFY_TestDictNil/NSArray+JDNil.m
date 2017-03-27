//
//  NSArray+JDNil.m
//  LFY_TestDictNil
//
//  Created by apple on 17/3/27.
//  Copyright © 2017年 Dareway Software Co., Ltd. All rights reserved.
//

#import "NSArray+JDNil.h"
#import "objc/runtime.h"

@implementation NSArray (JDNil)
+ (void)load {
    [super load];
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(xxf_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
}


@end
