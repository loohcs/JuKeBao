//
//  CustomTabBarViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-5-5.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "CustomTabBarView.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

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
    self.view.backgroundColor = [UIColor cyanColor];
    
    _customTabBarView = [[CustomTabBarView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60-60 + 20 + 44, SCREEN_WIDTH, 60)];
    _customTabBarView.delegate = self;
    [self.view addSubview:_customTabBarView];
    
    _arrayViewControllers = [NSArray arrayWithArray:[self getViewcontrollers]];
    [self touchBtnAtIndex:1];
}

-(void)touchBtnAtIndex:(NSInteger)index
{
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    
    NSDictionary* data = [_arrayViewControllers objectAtIndex:index];
    
    UIViewController *viewController = data[@"viewController"];
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    viewController.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height- 50);
    
    
    if (index == 2) {
        self.navigationItem.title = @"设置";
    }
    else
    {
        self.navigationItem.title = @"广告";
    }
    
    
    [self.view insertSubview:viewController.view belowSubview:_customTabBarView];
    
}

-(NSArray *)getViewcontrollers
{
    NSArray* tabBarItems = nil;
    
    MarketCustomersViewController *first = [[MarketCustomersViewController alloc] init];
    
    AdvertisementViewController *second = [[AdvertisementViewController alloc] init];
    
    SetingViewController *third = [[SetingViewController alloc] init];
    
    tabBarItems = [NSArray arrayWithObjects:
                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", first, @"viewController",@"商场客流",@"title", nil],
                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", second, @"viewController",@"广告",@"title", nil],
                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", third, @"viewController",@"设置",@"title", nil],nil];
    return tabBarItems;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
