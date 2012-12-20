#import <Foundation/Foundation.h>

/**对象序列化成Json格式，Json格式反序列化为对象实例*/
@interface RTJSON : NSObject

/**将一个对象实例转化成JSon格式的NSData*/
+ (NSData *)serializeObjectToData:(id)theObject;

/**将一个对象实例转化成JSon格式的字符串*/
+ (NSString *)serializeObjectToString:(id)theObject;

/*将一个JSon格式的字典转化成一组对象实例*/
+ (NSMutableArray *)deserializeJsonToObject:(NSDictionary *)json ClassName:(Class) aclass;
@end
