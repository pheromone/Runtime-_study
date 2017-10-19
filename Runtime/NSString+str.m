//
//  NSString+str.m
//  Runtime
//
//  Created by Shaoting Zhou on 2017/10/19.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "NSString+str.h"
#import <objc/message.h>

@implementation NSString (str)
//当文件被加载进来时调用
+(void)load{
    Method stringWithFormat = class_getClassMethod([NSString class], @selector(stringWithFormat:));
    Method ST_stringWithFormat = class_getClassMethod([NSString class], @selector(ST_stringWithFormat:));
    //方法交换
    method_exchangeImplementations(stringWithFormat, ST_stringWithFormat);
}

+(instancetype)ST_stringWithFormat:(NSString *)str{
    NSString * appendStr = [str stringByAppendingString:@",带上我"];
    return appendStr;
}
@end
