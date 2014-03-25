//
//  macysTests.m
//  macysTests
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "MCSDataStore.h"
#import "Entity.h"
#import "MCSMasterViewController.h"


@interface macysTests : XCTestCase

@end

@implementation macysTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testColorsForProduct{
    
    XCTAssertNotNil([[MCSDataStore sharedInstance]colorsForProductId:4], @"Return nil");

}


-(void)returnDataFromJSON{
    
    Entity *entity = [[Entity alloc]init];
    XCTAssertNotNil([entity jsonData], @"Json must contain data");
    
}


-(void)testMasterView{
    
    MCSMasterViewController *master = [[MCSMasterViewController alloc]init];
    
    XCTAssertNotNil(master, @"Json must contain data");
    
}



@end
