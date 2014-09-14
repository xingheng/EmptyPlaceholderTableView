//
//  OAArrayDataSource.h
//  CleanTableViewDataSource
//
//  Created by Phat, Le Tan on 5/2/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);
typedef NSString * (^IdentifierParserBlock)(id item);

@interface OAArrayDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) UIView *placeholderView;

- (id)initWithItems  :(NSArray *)items
identifierParserBlock:(IdentifierParserBlock)parserBlock
 configureCellBlock  :(TableViewCellConfigureBlock)configureCellBlock;

- (id)initWithItems  :(NSArray *)items
identifierParserBlock:(IdentifierParserBlock)parserBlock
 configureCellBlock  :(TableViewCellConfigureBlock)configureCellBlock
            rowHeight:(CGFloat)aRowHeight
      placeholderView:(UIView *)aView;

@end
