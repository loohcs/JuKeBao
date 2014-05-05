//
//  SetCustomCell.m
//  JuKeBao
//
//  Created by loohcs on 14-4-28.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "SetCustomCell.h"

@implementation SetCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _optionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 180, 30)];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        
        _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 5, 10, 30)];
        UIImage *selectImage = [[UIImage alloc] initWithContentsOfFile:@"select_image.png"];
        _selectImageView.image = selectImage;
        
        
        [self addSubview:_optionImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_selectImageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    

    
    
}

@end
