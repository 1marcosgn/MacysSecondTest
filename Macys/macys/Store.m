//
//  Store.m
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "Store.h"

@implementation Store

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super initWithDictionary:dictionary];
    if (self) {
        id storeId = [self valueForKey:@"id" fromDictionary:dictionary];
        if (!storeId) {
            storeId = [self valueForKey:NSStringFromSelector(@selector(storeId)) fromDictionary:dictionary];
        }
        self.storeId = storeId;
        self.name = [self valueForKey:NSStringFromSelector(@selector(name)) fromDictionary:dictionary];
        self.key = [self valueForKey:NSStringFromSelector(@selector(key)) fromDictionary:dictionary];
    }
    return self;
}

@end
