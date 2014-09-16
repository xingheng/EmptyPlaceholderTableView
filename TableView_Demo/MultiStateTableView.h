//
//  MultiStateTableView.h
//  SmartLightClient
//
//  Created by WeiHan on 9/16/14.
//  Copyright (c) 2014 HHT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MultiStateTableViewFlag) {
    MultiStateTableViewSuccess,
    MultiStateTableViewSuccessWithNull,
    MultiStateTableViewFailed
};


@protocol MultiStateTableViewDelegate <NSObject>

- (UIView *)loadViewForState:(MultiStateTableViewFlag)aFlag;

@end


@interface MultiStateTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) MultiStateTableViewFlag stateFlag;

@property (nonatomic, assign) id<MultiStateTableViewDelegate> multiStateDelegate;

- (void)loadForState:(MultiStateTableViewFlag)aFlag;
- (void)switchDataSource:(UITableView *)sourceTableView;

@end
