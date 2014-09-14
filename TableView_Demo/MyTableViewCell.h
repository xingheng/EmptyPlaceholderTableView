//
//  MyTableViewCell.h
//  TableView_Demo
//
//  Created by WeiHan on 9/14/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TableViewLoadingFailedDelegate <NSObject>

- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)rowHeight;

@end


@interface MyTableViewCell : UITableViewCell<TableViewLoadingFailedDelegate>

@end
