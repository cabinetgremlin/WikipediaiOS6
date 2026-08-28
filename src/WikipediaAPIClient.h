#import <Foundation/Foundation.h>

typedef void (^WikiSearchCompletionHandler)(NSArray *results, NSError *error);
typedef void (^WikiContentCompletionHandler)(NSString *htmlContent, NSError *error);

@interface WikipediaAPIClient : NSObject

+ (instancetype)sharedClient;
- (void)searchArticlesWithQuery:(NSString *)query completion:(WikiSearchCompletionHandler)completion;
- (void)fetchArticleContentWithTitle:(NSString *)title completion:(WikiContentCompletionHandler)completion;

@end