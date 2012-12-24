
#import "HttpHelper.h"

@implementation HttpHelper


-(NSString *) getJSONString:(NSString *)url
{
  NSError *error;
  
  NSString * ret = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:&error];
  
  if(!error)
  {
    return ret;
  }
  else
  {
    NSLog(@"%@",error.description);
    return nil;
  }
}


-(NSString *) postJSONString:(NSString *)url JSONString:(NSString  *)jsonString
{
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
  [request setHTTPMethod:@"POST"];
  [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
  
  NSURLResponse *reponse;
  NSError *error=nil;
  
  NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&reponse error:&error];
  
  if(error)
  {
    NSLog(@"%@",error.description);
  }
  
  return [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
  
}

-(NSString *) postRTModel:(NSString *)url RTModels:(NSMutableArray  *)rtmodels
{
    NSString * jsonStr =[NSString stringWithFormat:@"json=%@",[rtmodels jsonString]];
  return [self postJSONString:url JSONString:jsonStr];
}
@end
