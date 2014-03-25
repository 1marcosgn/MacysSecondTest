//
//  Color.h
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "Entity.h"
#import "UIColor+Hex.h"

@interface Color : Entity

@property (nonatomic) NSNumber *colorId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *rgb;

@end
