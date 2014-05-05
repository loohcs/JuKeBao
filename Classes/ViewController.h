//
//  ViewController.h
//  JuKeBao
//
//  Created by loohcs on 14-1-22.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@protocol tabBarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;

@end


@interface ViewController : BasicViewController <EAIntroDelegate>

//@property(nonatomic,strong) tabbarView *tabbar;
@property(nonatomic,strong) NSArray *arrayViewcontrollers;

@end
