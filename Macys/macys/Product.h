//
//  Product.h
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "Entity.h"

@interface Product : Entity

@property (nonatomic) NSNumber *productId;  // the same as id, prefer not to use it, since it's a objc keyword
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *explonation; // the same as 'description'. not available, cause it's already defined in NSObject
@property (nonatomic) NSNumber *regularPrice;
@property (nonatomic) NSNumber *salePrice;
@property (nonatomic) UIImage *productPhoto;
@property (nonatomic) NSMutableArray *colors;
@property (nonatomic) NSMutableArray *stores;

@end
