//
//  UICollectionView+DataSourceController.m
//  Pods
//
//  Created by Alex Bumbu on 14/10/15.
//
//

#import "UICollectionView+DataSourceController.h"
#import <objc/runtime.h>

@implementation UICollectionView (DataSourceController)

@dynamic dataSourceController;

- (void)setDataSourceController:(id<ABCollectionViewDataSourceController>)dataSourceController {
    objc_setAssociatedObject(self, @selector(dataSourceController), dataSourceController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = dataSourceController;
    self.dataSource = dataSourceController;
    
    dataSourceController.collectionView = self;
}

- (id<ABCollectionViewDataSourceController>)dataSourceController {
    return objc_getAssociatedObject(self, @selector(dataSourceController));
}

@end
