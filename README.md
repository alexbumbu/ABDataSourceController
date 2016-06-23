# ABDataSourceController

Simple Objective-C and [Swift](https://github.com/alexbumbu) implementation for getting rid of your UITableView & UICollectionView delegate and data source code from your UIViewController and share it between UIViewControllers.

## Compatibility

* iOS 7.0 or newer

## Integration

* Install via cocoapods (just add pod ```'ABDataSourceController', '~> 1.1'``` to your Podfile), or clone this repository and drag the content of ```ABDataSourceController``` folder to your project.  
* For using with table view you just need to create your custom data source controller object that implements ```ABTableViewDataSourceController``` protocol:

```objective-c
#import "ABDataSourceController.h"

@interface CustomDataSourceController : NSObject <ABTableViewDataSourceController>

@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, assign) IBOutlet UIViewController *viewController;

@end

@implementation CustomDataSourceController {
    NSArray *_dataSource;
}

@synthesize tableView = _tableView;
@synthesize viewController = _viewController;

@end
```

* Now override ```refreshDataSourceWithCompletionHandler``` method to load data source:

```objective-c
- (void)refreshDataSourceWithCompletionHandler:(void (^)())completion {
    [self loadDataSource];

    if (completion)
        completion();
}
```

* and write all your ```UITableViewDataSource``` & ```UITableViewDelegate``` code:

```objective-c
#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"DefaultCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];

    return cell;
}

```

* To use from Interface Builder add an object to your view controlle XIB and change it's class to CustomDataSourceController ([click here for tutorial](https://developer.apple.com/library/ios/recipes/xcode_help-IB_objects_media/Chapters/CustomObject.html)). Now connect the ```tableView``` and ```viewController``` outlets for the newly created object and connect the table view's ```dataSourceController``` outlet to your custom object. You're ready to go! 
* To use from code initialize the data source controller in your UIViewController, assign it to your UITableView ```dataSourceController``` property and you're ready to go!

```objective-c
#import "UITableView+DataSourceController.h"

@implementation MainViewController {
    IBOutlet UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // setup data source controller
    CustomDataSourceController *dataSourceCtrl = [[CustomDataSourceController alloc] init];
    dataSourceCtrl.tableView = tableView;
    dataSourceCtrl.viewController = self;
    tableView.dataSourceController = dataSourceCtrl;

    // load data source
    [tableView.dataSourceController refreshDataSourceWithCompletionHandler:nil];
}

@end
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