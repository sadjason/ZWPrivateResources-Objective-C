//
//  ViewController.m
//  MantlePlayground
//
//  Created by zhangwei on 16/8/9.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Mantle.h"
#import "StoryItem.h"
#import "LatestStories.h"

@interface ViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *httpManager;
@property (nonatomic, strong) AFHTTPRequestOperationManager *connectionManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(id)sender
{
    NSString *URLString = @"http://news-at.zhihu.com/api/4/news/latest";
    
    self.httpManager =
    [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [self.httpManager GET:URLString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *error;
        
        LatestStories *stories =
        [MTLJSONAdapter modelOfClass:LatestStories.class fromJSONDictionary:responseObject error:&error];
        
        if (error) {
            NSLog(@"fuck: %@", error);
        } else {
            NSLog(@"lxq: %@", stories);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

@end
