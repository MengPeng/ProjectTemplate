#import <UIKit/UIKit.h>
#import "RTModel.h"
#import "NSArray+JSONArray.h"

/**
基于HTTP协议的常用函数封装
*/
@interface HttpHelper : NSObject

/**
 通过指定的URL获取返回JSon格式内容，返回值为NSString形式。
*/
-(NSString *) getJSONString:(NSString *)url;


/**
 向一个URL提交一个JSon内容
 @param [in] url 提交数据的URL地址
 @param [in] JSonData 需要提交的JSon内容
 @par 示例
 @code
 HttpHelper *http = [[HttpHelper alloc] init];
 
 //将对象或一组对象序列化成JSON格式的字符串
 
 NSString *jsonString = [RTJSON serializeObjectToString:user];//user是一个UserModel对象实例;
 
 //提交到Web端进行数据更新
 [http postJSONData:@"http://192.168.1.67:34062/Home/SetUser" JSONString:jsonString];
 @endcode
 */
-(NSString *) postJSONString:(NSString *)url JSONString:(NSString  *)jsonString;

-(NSString *) postRTModel:(NSString *)url RTModels:(NSMutableArray  *)rtmodels;

@end
