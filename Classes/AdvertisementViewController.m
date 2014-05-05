//
//  AdvertisementViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-30.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "AdvertisementViewController.h"

@interface AdvertisementViewController ()

@end

@implementation AdvertisementViewController

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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    UIImage *headImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"headImage" ofType:@"png"]];
    _headImageView.image = headImage;
    [_scrollView addSubview:_headImageView];
    
    _adTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 0, SCREEN_HEIGHT - 44 - 40 - 200)];
    _adTableView.delegate = self;
    _adTableView.dataSource = self;
    [_scrollView addSubview:_adTableView];
    
    [self.view addSubview:_scrollView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"CellIndentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
