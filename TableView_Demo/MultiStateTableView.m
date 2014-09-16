//
//  MultiStateTableView.m
//  SmartLightClient
//
//  Created by WeiHan on 9/16/14.
//  Copyright (c) 2014 HHT. All rights reserved.
//

#import "MultiStateTableView.h"

@interface MultiStateTableView()


@end

@implementation MultiStateTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)loadForState:(MultiStateTableViewFlag)aFlag
{
    self.stateFlag = aFlag;
}

// Note: After switching to this tableview delegate, you own the responsibility to restore it back, if needed.
- (void)switchDataSource:(UITableView *)sourceTableView
{
    sourceTableView.dataSource = self;
    sourceTableView.delegate = self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:tableView.frame];
    
    if (self.multiStateDelegate)
    {
        UIView *view = [self.multiStateDelegate loadViewForState:self.stateFlag];
        if (view)
            [cell addSubview:view];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height;
}

@end
