//
//  ServiceWebViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-24.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "ServiceWebViewController.h"

@interface ServiceWebViewController ()

@end

@implementation ServiceWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"服务协议";
    
    _serviceWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resPath = [bundle resourcePath];
    NSString *filePath = [resPath stringByAppendingPathComponent:@"service.html"];
    [_serviceWebView loadHTMLString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]
                    baseURL:[NSURL fileURLWithPath:[bundle bundlePath]]];
    [self.view addSubview:_serviceWebView];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
