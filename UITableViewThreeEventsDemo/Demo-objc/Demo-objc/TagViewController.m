//
//  TagViewController.m
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import "TagViewController.h"
#import "Cell.h"

@interface TagViewController()

@property (nonatomic, strong) NSMutableArray     *dataArray;

@end

@implementation TagViewController

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
    cell.delBtn.tag = indexPath.row;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - Events
//可以正确进行删除操作，没有删除动画
- (void)delItem:(UIButton *)btn{
    
    NSInteger index = btn.tag;
    [self.dataArray removeObjectAtIndex:index];
    [self.tableView reloadData];
}

//第一次可以正常，后续会出错，有crash
//- (void)delItem:(UIButton *)btn{
//
//    NSInteger index = btn.tag;
//    [self.dataArray removeObjectAtIndex:index];
//    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
//}

//第一次可以正常，后续会出错，不会crash
//- (void)delItem:(UIButton *)btn{
//    
//    NSInteger index = btn.tag;
//    if (index < self.dataArray.count) {
//        [self.dataArray removeObjectAtIndex:index];
//        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
//    }else{
//        NSLog(@" ");
//        NSLog(@"－－－－越界－－－－");
//        NSLog(@"当前index -> %ld",(long)index);
//        NSLog(@"array count -> %lu",(unsigned long)self.dataArray.count);
//    }
//}
@end
