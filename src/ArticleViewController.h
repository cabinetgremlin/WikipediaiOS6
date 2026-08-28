#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) NSString *articleTitle;
@property (strong, nonatomic) UIWebView *webView;

- (instancetype)initWithArticleTitle:(NSString *)title;
@end