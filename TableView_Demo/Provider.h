//
//  Provider.h
//  TableView_Demo
//
//  Created by WeiHan on 9/15/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Provider : NSObject<UITableViewDataSource, UITableViewDelegate>
- (void) applyTo:(UITableView*) tableview;
@end
