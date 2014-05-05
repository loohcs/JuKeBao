//
//  SetingViewController.h
//  JuKeBao
//
//  Created by loohcs on 14-4-28.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetingViewController : BasicViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *optionTableView;
@property (nonatomic, strong) NSArray *optionArray;

@end
