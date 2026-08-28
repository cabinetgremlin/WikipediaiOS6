#import "MainViewController.h"
#import "WikipediaAPIClient.h"
#import "ArticleViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Wikipedia";
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search Wikipedia...";
    self.tableView.tableHeaderView = self.searchBar;
    
    self.searchResults = @[];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    if (searchBar.text.length == 0) return;
    
    [[WikipediaAPIClient sharedClient] searchArticlesWithQuery:searchBar.text completion:^(NSArray *results, NSError *error) {
        if (!error && results) {
            self.searchResults = results;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"WikiCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSDictionary *item = self.searchResults[indexPath.row];
    cell.textLabel.text = item[@"title"];
    
    // Strips raw HTML tags out of snippets using the correct selector
    NSString *snippet = item[@"snippet"] ?: @"";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<[^>]*>" options:0 error:nil];
    cell.detailTextLabel.text = [regex stringByReplacingMatchesInString:snippet options:0 range:NSMakeRange(0, snippet.length) withTemplate:@""];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.searchResults[indexPath.row];
    ArticleViewController *articleVC = [[ArticleViewController alloc] initWithArticleTitle:item[@"title"]];
    [self.navigationController pushViewController:articleVC animated:YES];
}

@end
