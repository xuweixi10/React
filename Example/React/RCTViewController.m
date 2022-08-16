//
//  RCTViewController.m
//  React
//
//  Created by 40662756 on 08/15/2022.
//  Copyright (c) 2022 40662756. All rights reserved.
//

#import "RCTViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTEventEmitter.h>
@interface RCTViewController ()

@end

@implementation RCTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *jsCodeLocation;
//    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    // jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"]; //手动拼接jsCodeLocation用于开发环境 //jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"]; //release之后从包中读取名为main的静态js bundle

    //这个"App1"名字一定要和我们在index.js中注册的名字保持一致
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"App1" initialProperties:nil launchOptions:nil];
    self.view = rootView;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
