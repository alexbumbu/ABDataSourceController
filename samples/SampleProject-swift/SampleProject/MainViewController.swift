//
//  ViewController.swift
//  SampleProject
//
//  Created by Alex Bumbu on 21/06/16.
//  Copyright © 2016 Alex Bumbu. All rights reserved.
//

import UIKit


class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let dataSourceController: MainViewControllerDataSource = MainViewControllerDataSource();
        dataSourceController.tableView = self.tableView
        dataSourceController.viewController = self
        self.tableView.dataSourceController = dataSourceController
        
        // load data source
        self.tableView.dataSourceController?.refreshDataSource(nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: -
class MainViewControllerDataSource: NSObject, ABTableViewDataSourceController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewController: UIViewController!
    private var _dataSource: [String] = []
    
    
    // MARK: ABDataSourceController Methods
    func refreshDataSource(completionHandler: (() -> Void)? = nil) {
        self.loadDataSource()
        
        completionHandler?()
    }
    
    
    // MARK: UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataSource.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "ABMenuTableViewCell"
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier)!
        cell.textLabel?.text = _dataSource[indexPath.row]
        cell.detailTextLabel?.textColor = .darkGrayColor()
        cell.detailTextLabel?.text = "swipe to show custom menu"
        
        return cell
    }
        
    
    // MARK: UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: Private Methods
    func loadDataSource() {
        let path: String = NSBundle.mainBundle().pathForResource("DataSource", ofType: "plist")!
        _dataSource = NSArray(contentsOfFile: path)! as! [String]
    }
}

