//
//  ViewController.m
//  GCDPlayground
//
//  Created by zhangwei on 16/8/8.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t myCustomQueue = dispatch_get_main_queue();//dispatch_queue_create("com.example.MyCustomQueue", NULL);
    
    dispatch_async(myCustomQueue, ^{
        printf("Do some work here.\n");
    });
    
    printf("The first block may or may not have run.\n");
    
//    dispatch_sync(myCustomQueue, ^{
//        printf("Do some more work here.\n");
//    });
//    printf("Both blocks have completed.\n");

}

@end
