#import "ArticleViewController.h"
#import "WikipediaAPIClient.h"

@implementation ArticleViewController

- (instancetype)initWithArticleTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _articleTitle = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.articleTitle;
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    [[WikipediaAPIClient sharedClient] fetchArticleContentWithTitle:self.articleTitle completion:^(NSString *htmlContent, NSError *error) {
        if (!error && htmlContent) {
            // Readability CSS optimized for legacy screens
            NSString *styledHTML = [NSString stringWithFormat:
                @"<html><head><style>"
                "body { font-family: 'Helvetica Neue', Helvetica; padding: 12px; font-size: 16px; line-height: 1.5; color: #111; }"
                "img { max-width: 100%%; height: auto; }"
                "a { color: #0066cc; text-decoration: none; }"
                "</style></head><body>%@</body></html>", htmlContent];
            
            [self.webView loadHTMLString:styledHTML baseURL:[NSURL URLWithString:@"https://en.wikipedia.org"]];
        }
    }];
}

@end