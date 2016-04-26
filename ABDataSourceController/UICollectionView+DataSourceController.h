//
//  UICollectionView+DataSourceController.h
//  Pods
//
//  Created by Alex Bumbu on 14/10/15.
//
//

#import <UIKit/UIKit.h>
#import "ABDataSourceController.h"

@interface UICollectionView (DataSourceController)

@property (nonatomic, strong) IBOutlet id<ABCollectionViewDataSourceController> dataSourceController;

@end
