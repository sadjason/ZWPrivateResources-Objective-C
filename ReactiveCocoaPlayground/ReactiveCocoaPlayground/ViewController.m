//
//  ViewController.m
//  ReactiveCocoaPlayground
//
//  Created by zhangwei on 16/8/4.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"被订阅了");
        [[RACScheduler mainThreadScheduler] afterDelay:2.5 schedule:^{
            @weakify(subscriber);
            NSLog(@"发送消息啦");
            NSLog(@"subscriber.id = %x", subscriber);
            if (subscriber == nil) {
                NSLog(@"我猜对了");
            }
            [subscriber sendNext:@"1"];
            [subscriber sendNext:@"2"];
            [subscriber sendCompleted];
        }];
        
        RACDisposable *disposable1 = [RACDisposable disposableWithBlock:^{
            NSLog(@"disposable block");
        }];
        NSLog(@"disposable1.id = %x", disposable1);
        return disposable1;
    }];
    
    RACDisposable *disposable2 = [signal subscribeNext:^(id x) {
        NSLog(@"next value: %@", x);
    } completed:^{
        NSLog(@"complete event");
    }];
    NSLog(@"disposable2.id = %x", disposable2);
    
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [disposable2 dispose];
    }];
}

@end
