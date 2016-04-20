//
//  Cell.h
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel  *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@property (nonatomic, strong) Model     *model;

@end
