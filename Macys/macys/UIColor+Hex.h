//
//  UIColor+Hex.h
//  reciept-organizer
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIColor (Hex)

- (NSUInteger)colorCode;
+ (UIColor *)colorFromRGB:(NSUInteger)rgbValue;

@end
