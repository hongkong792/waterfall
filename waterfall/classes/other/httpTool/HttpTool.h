//
//  HttpTool.h
//  waterfall
//
//  Created by 杨香港 on 2017/3/2.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id object);
typedef void(^failureBlock)(id object);

@interface HttpTool : NSObject
+(void)dataWithUrl:(NSString *)url prams:(NSDictionary *)dic success:(successBlock)success failure:(failureBlock)faliure;
@end
