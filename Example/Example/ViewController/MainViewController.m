//
//  ViewController.m
//  WebTest
//
//  Created by liaojinxing on 14-2-7.
//  Copyright (c) 2014年 Douban. All rights reserved.
//

#import "MainViewController.h"
#import "ResourceManager.h"
#import "WebBridgeAPI.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WishViewController.h"

@interface MainViewController ()<JSCResponseDelegate>

@property (strong, nonatomic)  UIBarButtonItem *switchButton;

@end

@implementation MainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self loadTamplate];
  
  self.responseDelegate = self;
}

- (void)loadTamplate
{
  ResourceManager *manager = [ResourceManager sharedManager];

  NSString *filePath = [NSString stringWithFormat:@"%@/www/index.html", [manager resourceFilePath]];
  NSURL *url = [NSURL fileURLWithPath:filePath isDirectory:NO];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
}

- (NSString *)responseForEventType:(NSString *)eventType message:(NSString *)message
{
  if ([eventType isEqualToString:@"wish"]) {
    WishViewController *controller = [[WishViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    return @"";
  }
  return @"haha";
}

@end
