//
//  ViewController.m
//  TableView_Demo
//
//  Created by WeiHan on 9/12/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "OAArrayDataSource.h"
#import "MultiStateTableView.h"
#import "Provider.h"

#define kTableViewID    @"kTableViewIdentifier"

@interface ViewController ()
{
    NSMutableArray *originDataSource;
    MultiStateTableView *newTableView;
}

@property (strong, nonatomic) OAArrayDataSource *arrayDataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    originDataSource = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0; i < 5; i++)
    {
        [originDataSource addObject:@(i)];
    }
    
    //To use CleanTableViewDataSource, you should register the cell with identifer
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewID];
    self.myTableView.dataSource = self.arrayDataSource;
    self.myTableView.delegate = self.arrayDataSource;
}

- (OAArrayDataSource *)arrayDataSource
{
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, id item) {
        //Configure cell within this block. If there are many types of cell, write more blocks or functions to configure cell depending on the item passing.
        cell.textLabel.text = [item stringValue];
    };
    IdentifierParserBlock identifierParserBlock = ^NSString *(id item) {
        //Depend on item data, return the right cell identifier here.
        return kTableViewID;
    };
    
    UILabel *placeholderView = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    [placeholderView setText:@"arrayDataSource: placeholder for empty table."];
    
    if (!_arrayDataSource) {
        _arrayDataSource = [[OAArrayDataSource alloc] initWithItems:originDataSource
                                              identifierParserBlock:identifierParserBlock
                                                 configureCellBlock:configureCell
                                                          rowHeight:40
                                                    placeholderView:placeholderView];
    }
    return _arrayDataSource;
}

- (void) initProvider {
//    Provider* provider1 = [[Provider alloc] init];
//    Provider* provider2 = [[Provider alloc] init];
//    // Switch Provider
//    BOOL condition = YES;
//    if (condition) {
//        self.myTableView.dataSource = provider1;
//        self.myTableView.delegate = provider1;
//        [self.myTableView reloadData];
//    } else {
//        self.myTableView.dataSource = provider2;
//        self.myTableView.delegate = provider2;
//        [self.myTableView reloadData];
//    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
    
    newTableView = [[MultiStateTableView alloc] initWithFrame:self.myTableView.frame];
    newTableView.multiStateDelegate = self;
    
    [newTableView setStateFlag:MultiStateTableViewFailed];
    
    [newTableView switchDataSource:self.myTableView];
    
    [self.myTableView reloadData];
}

- (UIView *)loadViewForState:(MultiStateTableViewFlag)aFlag
{
    UILabel *view;
    
    switch (aFlag) {
        case MultiStateTableViewFailed:
            view = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
            view.text = @"Loading data failed.";
            break;
            
        case MultiStateTableViewSuccessWithNull:
            view = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
            view.text = @"Loading successfully with empty data.";
            break;
            
            //        case MultiStateTableViewSuccess:
            //            break;
        default:
            break;
    }
    
    return view;
}

@end
