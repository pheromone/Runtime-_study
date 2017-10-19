//
//  ViewController.m
//  Runtime
//
//  Created by Shaoting Zhou on 2017/10/19.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //动态交换系统方法和自定义方法的实现
    NSString * myStr = [NSString stringWithFormat:@"飞吧"];
    NSLog(@"%@",myStr);
    //动态添加方法
    Person * p = [[Person alloc]init];
    [p performSelector:@selector(ppp) withObject:nil];
    //动态的取属性
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([Person class], &count);
    //　遍历成员变量列表，其中每个变量都是Ivar类型的结构体
    for (const Ivar *p = ivars; p < ivars + count; ++p)
    {
        Ivar const ivar = *p;
        //　获取变量名
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@",key);
    }
    
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
