//
//  SignUpViewController.h
//  JuKeBao
//
//  Created by loohcs on 14-4-24.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : BasicViewController

@property (nonatomic, strong) UITextField *phoneNumText;
@property (nonatomic, strong) UITextField *securityCodeText;
@property (nonatomic, strong) UITextField *securityCodeTextSame;

@property (nonatomic, strong) UIButton *sendCode;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *serviceProtocol;



@end
