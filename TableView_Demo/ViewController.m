//
//  ViewController.m
//  TableView_Demo
//
//  Created by WeiHan on 9/12/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "ViewController.h"

#define kTableViewID    @"kTableViewIdentifier"

@interface ViewController ()
{
    NSMutableArray *dataArray;
    NSMutableArray *dataArray2;
}

@end

static bool fNewDataSource = false;

@implementation ViewController

static int len = 5;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [[NSMutableArray alloc] initWithCapacity:10];
    for( int i = 0; i < len; i++)
    {
        [dataArray addObject:@(i)];
    }
}

- (void)updateDataArray2
{
    BOOL isEmpty = NO;
    if (dataArray2 == nil)
    {
        isEmpty = YES;
        dataArray2 = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    for( int i = 0; i < len; i++)
    {
        if (isEmpty)
            [dataArray2 addObject:@(i*i)];
        else
        {
            int num = [dataArray2[i] intValue];
            dataArray2[i] = @(num * 2);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
//    NSLog(@"Changing to new data source");
    [self updateDataArray2];
    
    fNewDataSource = true;
    [self.myTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!fNewDataSource)
    {
        return [dataArray count];
    }
    else
    {
        return [dataArray2 count];
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

static int myCount = 0, myCountCreate = 0;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewID];
        myCountCreate++;
    }
    
    myCount++;
    
    NSInteger index = indexPath.row;
    
    if (!fNewDataSource)
        cell.textLabel.text = [[dataArray objectAtIndex:index] stringValue];
    else
        cell.textLabel.text = [[dataArray2 objectAtIndex:index] stringValue];
    
    
    NSLog(@"myCount: %d, myCountCreate: %d", myCount, myCountCreate);
    return cell;
}

@end
