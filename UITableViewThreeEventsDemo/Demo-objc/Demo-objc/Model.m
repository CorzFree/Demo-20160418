//
//  Model.m
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)initWithTitle:(NSString *)title{
    Model *model = [[Model alloc] init];
    model.title  = title;
    return model;
}

+ (NSArray *)getData{
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 10; i ++) {
        [arr addObject:[Model initWithTitle:[NSString stringWithFormat:@"title->%d",i]]];
    }
    return arr;
}

@end
