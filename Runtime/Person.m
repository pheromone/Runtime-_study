//
//  Person.m
//  Runtime
//
//  Created by Shaoting Zhou on 2017/10/19.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person
void runMe(){
    NSLog(@"你没有实现这个方法");
}
//当发现类有实例方法没有实现时,会提供一次机会做处理
+(BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@"%@",NSStringFromSelector(sel));
    //动态添加方法
    if(sel == @selector(ppp)){
        /*
         class 类
         SEL 方法编号
         IMP 方法实现
         types 类型
         */
        class_addMethod([self class], sel, (IMP)runMe, "");
    }
    return [super resolveInstanceMethod:sel];
}


@end
