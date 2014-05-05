//
//  CustomTabBarView.h
//  JuKeBao
//
//  Created by loohcs on 14-5-5.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBarViewController.h"

@interface CustomTabBarView : UIView

@property (nonatomic, strong) UIImageView *tabbarImageView;
@property (nonatomic, strong) UIImageView *tabarViewCenter;

@property (nonatomic, strong) UIButton *button_AD;
@property (nonatomic, strong) UIButton *button_Set;
@property (nonatomic, strong) UIButton *button_Market;
@property (nonatomic, strong) UIButton *button_Floor;

@property (nonatomic, strong) id<customTabBarDelegate> delegate;

@end
