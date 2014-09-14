//
//  ViewController.m
//  TableView_Demo
//
//  Created by WeiHan on 9/12/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

#define kTableViewID    @"kTableViewIdentifier"

@interface ViewController ()
{
    NSMutableArray *dataArray;
}

@end

static bool fLoadingFailed = false;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
//    NSLog(@"Changing to new data source");
    
    fLoadingFailed = true;
    [self.myTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return fLoadingFailed ? 1 : [dataArray count];
}

static int myCount = 0, myCountCreate = 0;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (fLoadingFailed)
    {
        MyTableViewCell *placeholderCell = [[MyTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        //placeholderCell.textLabel.text = @"Placeholder for loading failed.";
        return placeholderCell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewID];
        myCountCreate++;
    }
    
    myCount++;
    
    
    
    NSInteger index = indexPath.row;
    cell.textLabel.text = [[dataArray objectAtIndex:index] stringValue];
    
    //NSLog(@"myCount: %d, myCountCreate: %d", myCount, myCountCreate);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return fLoadingFailed ? tableView.frame.size.height : 40;
}

@end
