//
//  OAArrayDataSource.m
//  CleanTableViewDataSource
//
//  Created by Phat, Le Tan on 5/2/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OAArrayDataSource.h"

@interface OAArrayDataSource()
{
    BOOL fLoadingFailed;
    CGFloat rowHeight;
}

@property (strong, nonatomic) IdentifierParserBlock identifierParserBlock;
@property (strong, nonatomic) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation OAArrayDataSource

- (id)initWithItems  :(NSArray *)items
identifierParserBlock:(IdentifierParserBlock)parserBlock
 configureCellBlock  :(TableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray arrayWithArray:items];
        self.identifierParserBlock = [parserBlock copy];
        self.configureCellBlock = [configureCellBlock copy];
        fLoadingFailed = NO;
    }
    return self;
}

- (id)initWithItems  :(NSArray *)items
identifierParserBlock:(IdentifierParserBlock)parserBlock
 configureCellBlock  :(TableViewCellConfigureBlock)configureCellBlock
            rowHeight:(CGFloat)aRowHeight
      placeholderView:(UIView *)aView
{
    if (self = [self initWithItems:items identifierParserBlock:parserBlock configureCellBlock:configureCellBlock])
    {
        rowHeight = aRowHeight;
        self.placeholderView = aView;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.items.count;
    if (count != 0)
    {
        fLoadingFailed = NO;
        return count;
    }
    
    fLoadingFailed = YES;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (fLoadingFailed)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height)];
        
        if (self.placeholderView)
            [cell addSubview:self.placeholderView];
        
        return cell;
    }
    
    id item = [self itemAtIndexPath:indexPath];
    NSString *identifier = self.identifierParserBlock(item);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    
    self.configureCellBlock(cell, item);
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return fLoadingFailed ? tableView.frame.size.height : rowHeight;
}

#pragma mark -

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.items.count) {
        return self.items[indexPath.row];
    }
    return nil;
}

@end
