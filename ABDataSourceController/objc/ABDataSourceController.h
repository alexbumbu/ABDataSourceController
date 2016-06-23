//
//  ABDataSourceController.h
//  ABDataSourceController
//
//  Created by Alex Bumbu on 10/07/15.
//  Copyright (c) 2015 Alex Bumbu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ABDataSourceController <NSObject>

@property (nonatomic, assign) IBOutlet UIViewController *viewController;

- (void)refreshDataSourceWithCompletionHandler:(void (^)())completion;

@end


@protocol ABTableViewDataSourceController <ABDataSourceController, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) IBOutlet UITableView *tableView;

@end


@protocol ABCollectionViewDataSourceController <ABDataSourceController, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, assign) IBOutlet UICollectionView *collectionView;

@end
