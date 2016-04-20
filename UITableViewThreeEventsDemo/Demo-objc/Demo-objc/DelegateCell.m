//
//  DelegateCell.m
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import "DelegateCell.h"

@implementation DelegateCell

- (void)setModel:(Model *)model{
    _model = model;
    
    self.titleLabel.text = model.title;
}

- (void)setDelegate:(id<CellDelegate>)delegate{
    _delegate = delegate;
}

- (IBAction)delClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(delBtnClick:)]) {
        [self.delegate delBtnClick:self];
    }
}
@end
