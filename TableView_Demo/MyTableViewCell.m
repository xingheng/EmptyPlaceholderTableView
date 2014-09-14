//
//  MyTableViewCell.m
//  TableView_Demo
//
//  Created by WeiHan on 9/14/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()
{
    UILabel *label;
}

@end

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.frame.size.width, self.frame.size.height)];
        label.text = @"MyTableViewCell: placeholder for loading failed.";
        label.textAlignment = NSTextAlignmentJustified;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self addSubview:label];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
