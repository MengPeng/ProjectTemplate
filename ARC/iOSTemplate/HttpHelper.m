
#import "HttpHelper.h"

@implementation HttpHelper

-(NSDictionary *) getJSon:(NSString *)url
{
  NSError *error;
  NSURLRequest *request  = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
  NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
  
  if(error)
  {
    NSLog(@"%@",error.description);
    return nil;
  }

  NSDictionary *res = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
  
  if(error)
  {
    NSLog(@"%@",error.description);
    return nil;
  }
  
  return res;
}
@end
