#import <UIKit/UIKit.h>

@interface HttpHelper : NSObject {

}

-(NSDictionary *) getJsonData:(NSString *)url;
-(NSString *) getJsonString:(NSString *)url;
-(NSString *) postJson:(NSString *)url JsonData:(NSData  *)jsonData;

@end
