//
//  ViewController.h
//  TableView_Demo
//
//  Created by WeiHan on 9/12/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)
#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)
#define kContent_Frame    (CGRectMake(0, 0 , kContent_Width, kContent_Height))
#define kContent_CenterX  (kContent_Width / 2)
#define kContent_CenterY  (kContent_Height / 2)


@interface ViewController : UIViewController<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)tapButton:(id)sender;

@end
