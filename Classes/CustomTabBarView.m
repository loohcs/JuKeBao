//
//  CustomTabBarView.m
//  JuKeBao
//
//  Created by loohcs on 14-5-5.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "CustomTabBarView.h"

@implementation CustomTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self layoutView];
    }
    return self;
}

- (void)layoutView
{
    _tabbarImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabbar_0" ofType:@"png"]]];
    _tabbarImageView.frame = CGRectMake(0, 9, _tabbarImageView.bounds.size.width, 51);
    [_tabbarImageView setUserInteractionEnabled:YES];
    
    _tabbarImageView.backgroundColor = [UIColor redColor];
    
    [self addSubview:_tabbarImageView];
    
    [self layoutBtn];
}

- (void)layoutBtn
{
    _button_Market = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_Market setFrame:CGRectMake(0, 0, 64, 60)];
    [_button_Market setTag:101];
    [_button_Market addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_Floor = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_Floor setFrame:CGRectMake(56, 0, 64, 60)];
    [_button_Floor setTag:102];
    [_button_Floor addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_AD = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [_button_1 setBackgroundColor:[UIColor blueColor]];
    [_button_AD setFrame:CGRectMake(202, 0, 64, 60)];
    [_button_AD setTag:103];
    [_button_AD addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_Set = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_Set setFrame:CGRectMake(267, 0, 64, 60)];
    [_button_Set setTag:104];
    [_button_Set addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [_tabbarImageView addSubview:_button_Market];
    [_tabbarImageView addSubview:_button_Floor];
    [_tabbarImageView addSubview:_button_AD];
    [_tabbarImageView addSubview:_button_Set];
}

-(void)btn1Click:(id)sender
{
    
    UIButton *btn = (UIButton *)sender;
    NSLog(@"%i",btn.tag);
    switch (btn.tag) {
        case 101:
        {
            [_tabbarImageView setImage:[UIImage imageNamed:@"tabbar_0"]];
            [self.delegate touchBtnAtIndex:0];
            
            break;
        }
        case 102:
        {
            [_tabbarImageView setImage:[UIImage imageNamed:@"tabbar_1"]];
            [self.delegate touchBtnAtIndex:1];
            break;
        }
        case 103:
            [_tabbarImageView setImage:[UIImage imageNamed:@"tabbar_3"]];
            [self.delegate touchBtnAtIndex:2];
            break;
        case 104:
            [_tabbarImageView setImage:[UIImage imageNamed:@"tabbar_4"]];
            [self.delegate touchBtnAtIndex:2];
            break;
        default:
            break;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
