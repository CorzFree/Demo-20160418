//
//  DelegateCell.h
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@class DelegateCell;

@protocol CellDelegate <NSObject>

- (void)delBtnClick:(DelegateCell *)cell;

@end

@interface DelegateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) id<CellDelegate>  delegate;

@property (nonatomic, strong) Model     *model;


- (IBAction)delClick:(UIButton *)sender;

@end
