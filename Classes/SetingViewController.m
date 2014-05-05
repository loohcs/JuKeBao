//
//  SetingViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-28.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "SetingViewController.h"
#import "SetCustomCell.h"

@interface SetingViewController ()

@end

@implementation SetingViewController

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
    
    self.navigationItem.title = @"设置";
    
    _optionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-40) style:UITableViewStyleGrouped];
    _optionTableView.delegate = self;
    _optionTableView.dataSource = self;
    [self.view addSubview:_optionTableView];
    
    NSArray *arr1 = [[NSArray alloc] initWithObjects:@"清除缓存", nil];
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@"客服电话",@"意见反馈", @"帮助", nil];
    NSArray *arr3 = [[NSArray alloc] initWithObjects:@"检查更新",@"应用推荐", @"关于", @"给APPStore评分", nil];
    
    _optionArray = [[NSArray alloc] initWithObjects:arr1, arr2, arr3, nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [_optionArray objectAtIndex:section];
    NSInteger num = arr.count;
    
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"CellIdentify";
    SetCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = [[SetCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    
    NSArray *arr = [_optionArray objectAtIndex:indexPath.section];
    NSString *str = [arr objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = str;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
