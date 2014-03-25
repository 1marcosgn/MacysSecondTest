//
//  Color.m
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "Color.h"

@implementation Color

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super initWithDictionary:dictionary];
    if (self) {
        id colorId = [self valueForKey:@"id" fromDictionary:dictionary];    // from database
        if (!colorId) {
            colorId = [self valueForKey:NSStringFromSelector(@selector(colorId)) fromDictionary:dictionary];  // from json
        }
        self.colorId = colorId;
        self.name = [self valueForKey:NSStringFromSelector(@selector(name)) fromDictionary:dictionary];
        self.rgb = [self valueForKey:NSStringFromSelector(@selector(rgb)) fromDictionary:dictionary];
    }
    return self;
}

@end
