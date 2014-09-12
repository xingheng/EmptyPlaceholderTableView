//
//  ViewController.h
//  TableView_Demo
//
//  Created by WeiHan on 9/12/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)tapButton:(id)sender;

@end
