//
//  Model.h
//  Demo-20160419
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSString     *title;

+ (instancetype) initWithTitle:(NSString *)title;

+ (NSMutableArray *)getData;

@end
