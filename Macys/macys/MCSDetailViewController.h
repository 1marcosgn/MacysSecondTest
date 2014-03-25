//
//  MCSDetailViewController.h
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "MCSColorsViewController.h"

@class Product;

@interface MCSDetailViewController : UIViewController <
    UIScrollViewDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate,
    UIActionSheetDelegate,
    MCSObjectsViewControllerDelegate
>

/**
  A Product entity object being shown in MCSDetailViewController view
 */
@property (nonatomic) Product *detailItem;

@end
