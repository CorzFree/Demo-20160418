//
//  Cell.m
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)setModel:(Model *)model{
    _model = model;
    
    self.titleLabel.text = model.title;
}

@end
