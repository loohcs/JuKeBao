//
//  CustomTabBarViewController.h
//  JuKeBao
//
//  Created by loohcs on 14-5-5.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customTabBarDelegate <NSObject>

- (void)touchBtnAtIndex:(NSInteger)index;

@end

@class CustomTabBarView;

@interface CustomTabBarViewController : UIViewController<customTabBarDelegate>

@property (nonatomic, strong) CustomTabBarView *customTabBarView;
@property (nonatomic, strong) NSArray *arrayViewControllers;

@end
