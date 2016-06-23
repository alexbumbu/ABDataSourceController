//
//  ABDataSourceController.swift
//  SampleProject
//
//  Created by Alex Bumbu on 21/06/16.
//  Copyright © 2016 Alex Bumbu. All rights reserved.
//

import Foundation
import UIKit

public protocol ABDataSourceController  {
    var viewController: UIViewController! { get set }

    func refreshDataSource(completionHandler: (() -> Void)?)
}

public protocol ABTableViewDataSourceController: ABDataSourceController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView! { get set }
}

public protocol ABCollectionViewDataSourceController: ABDataSourceController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView! { get set }
}


//MARK: - UITableView extension
private var _dataSourceController: ABTableViewDataSourceController?

public extension UITableView {
    var dataSourceController: ABTableViewDataSourceController? {
        get {
            return objc_getAssociatedObject(self, &_dataSourceController) as? ABTableViewDataSourceController
        }
        set {
            objc_setAssociatedObject(self, &_dataSourceController, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            
            self.dataSource = newValue;
            self.delegate = newValue;
        }
    }
}


//MARK: - UICollectionView extension
private var _collectionDataSourceController: ABCollectionViewDataSourceController?

public extension UICollectionView {
    var dataSourceController: ABCollectionViewDataSourceController? {
        get {
            return objc_getAssociatedObject(self, &_collectionDataSourceController) as? ABCollectionViewDataSourceController
        }
        set {
            objc_setAssociatedObject(self, &_collectionDataSourceController, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            
            self.dataSource = newValue;
            self.delegate = newValue;
        }
    }
}