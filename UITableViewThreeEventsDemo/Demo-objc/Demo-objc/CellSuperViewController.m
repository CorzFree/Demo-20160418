//
//  CellSuperViewController.m
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import "CellSuperViewController.h"
#import "Cell.h"

@interface CellSuperViewController()

@property (nonatomic, strong) NSMutableArray     *dataArray;

@end

@implementation CellSuperViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [Model getData];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    [cell.delBtn addTarget:self action:@selector(delItem:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - Events
- (void)delItem:(UIButton *)btn{
    
    UIView *view = btn;
    while (view != nil && ![view isKindOfClass:[UITableViewCell class]]) {
        view = [view superview];
    }
    
    Cell *cell = (Cell *)view;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    
}

@end
