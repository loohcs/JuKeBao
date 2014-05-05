//
//  AdvertisementViewController.h
//  JuKeBao
//
//  Created by loohcs on 14-4-30.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "BasicViewController.h"

@interface AdvertisementViewController : BasicViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *adTableView;
@property (nonatomic, strong) UIImageView *headImageView;

@end
