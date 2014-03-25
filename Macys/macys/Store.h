//
//  Store.h
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "Entity.h"

@interface Store : Entity

@property (nonatomic) NSNumber *storeId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *key;

@end
