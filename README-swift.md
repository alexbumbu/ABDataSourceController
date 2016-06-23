# ABDataSourceController

Simple [Objective-C](https://github.com/alexbumbu/ABDataSourceController/blob/master/README.md) and Swift implementation for getting rid of your UITableView & UICollectionView delegate and data source code from your UIViewController and share it between UIViewControllers.

## Compatibility

* iOS 8.0 or newer

## Integration

* Install via cocoapods (just add pod ```'ABDataSourceController-swift', '~> 1.1'``` to your Podfile), or clone this repository and drag the content of ```ABDataSourceController/swift``` folder to your project.  
* For using with table view you just need to create your custom data source controller object that implements ```ABTableViewDataSourceController``` protocol:

```swift
import ABDataSourceController

class CustomDataSourceController: NSObject, ABTableViewDataSourceController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewController: UIViewController!

    func refreshDataSource(completionHandler: (() -> Void)? = nil) {
    }
}
```

* Now add data source loading code to ```refreshDataSource(completionHandler:)``` function:

```swift
func refreshDataSource(completionHandler: (() -> Void)? = nil) {
    self.loadDataSource()

    completionHandler?()
}
```

* and write all your ```UITableViewDataSource``` & ```UITableViewDelegate``` code:

```swift
// MARK: UITableViewDataSource Methods
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _dataSource.count;
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let identifier = "DefaultCell"

    var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier)
    if cell == nil {
        cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
    }

    cell!.textLabel?.text = _dataSource[indexPath.row]

    return cell!
}


// MARK: UITableViewDelegate Methods
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
}
```

* To use from Interface Builder add an object to your view controlle XIB and change it's class to CustomDataSourceController ([click here for tutorial](https://developer.apple.com/library/ios/recipes/xcode_help-IB_objects_media/Chapters/CustomObject.html)). Now connect the ```tableView``` and ```viewController``` outlets for the newly created object and connect the table view's ```dataSourceController``` outlet to your custom object. You're ready to go! 
* To use from code initialize the data source controller in your UIViewController, assign it to your UITableView ```dataSourceController``` property and you're ready to go!

```swift
class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let dataSourceController: CustomDataSourceController = CustomDataSourceController();
        dataSourceController.tableView = self.tableView
        dataSourceController.viewController = self
        self.tableView.dataSourceController = dataSourceController

        // load data source
        self.tableView.dataSourceController?.refreshDataSource(nil);
    }
}
```

* For using with collection view follow the same principle described above and make sure your custom data source controller object conforms to ```ABCollectionViewDataSourceController``` protocol.

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Credits

ABDataSourceController was created by [Alex Bumbu](https://github.com/alexbumbu).

## License

ABDataSourceController is available under the MIT license. See the LICENSE file for more info.
For usage without attribution contact [Alex Bumbu](mailto:alex.bumbu@gmail.com).