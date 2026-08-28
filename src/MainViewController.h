#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController <UISearchBarDelegate>
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResults;
@end