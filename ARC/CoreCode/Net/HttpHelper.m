
#import "HttpHelper.h"

@implementation HttpHelper

-(NSDictionary *) getJsonData:(NSString *)url
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

-(NSString *) getJsonString:(NSString *)url
{
  NSError *error = nil;
  NSDictionary * jsonDic = [self getJsonData:url];
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONReadingMutableLeaves error:&error];
  if(error)
  {    
    NSLog(@"%@",error.description);
  }
  return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(NSString *) postJson:(NSString *)url JsonData:(NSData  *)jsonData
{
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
  [request setHTTPMethod:@"POST"];
  [request setHTTPBody:jsonData];
  
  NSURLResponse *reponse;
  NSError *error=nil;
  
  NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&reponse error:&error];
  
  if(error)
  {
    NSLog(@"%@",error.description);
  }
  
  return [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
}
@end
