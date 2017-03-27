//
//  NSDictionary+ErrorCodeAndErrorText.m
//  LFY_TestDictNil
//
//  Created by administrator on 2017/3/27.
//  Copyright © 2017年 Dareway Software Co., Ltd. All rights reserved.
//

#import "NSDictionary+ErrorCodeAndErrorText.h"
#import <objc/runtime.h>


@implementation NSDictionary (ErrorCodeAndErrorText)

+ (void)load
{
    //NSDictnary的真实类型__NSDictionaryI
    Class class = objc_getClass("__NSDictionaryI");
    
    SEL originalSelector = @selector(objectForKey:);
    SEL swizzledSelector = @selector(dw_objectForKey:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}


- (id)errorCodeForKey:(id)key{
    id value = [self dw_objectForKey:key];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    value = [self dw_objectForKey:@"errorcode"];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    value = [self dw_objectForKey:@"errorCode"];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    return nil;
}
- (id)errorTextForKey:(id)key{
    id value = [self dw_objectForKey:key];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    value = [self dw_objectForKey:@"errortext"];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    value = [self dw_objectForKey:@"errorText"];
    if (value != nil && value != [NSNull null])
    {
        return value;
    }
    return nil;
}


- (nullable id)dw_objectForKey:(id)key
{
    if([key isEqualToString:@"errorCode"] || [key isEqualToString:@"errorcode"]){
        return  [self errorCodeForKey:@"errorcode"];
    }else if([key isEqualToString:@"errorText"] || [key isEqualToString:@"errorText"]){
        return  [self errorTextForKey:@"errorText"];
    }
    return [self dw_objectForKey:key];
}



@end
