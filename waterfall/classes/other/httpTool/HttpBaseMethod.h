//
//  HttpBaseMethod.h
//  waterfall
//
//  Created by 杨香港 on 2017/3/2.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpBaseMethod : NSObject

+ (void)getDataWithUrl:(NSString *)url parms:(NSDictionary *)dic successBlock:(void(^)(id json))successBlock failBlock:(void(^)(id json))failBlock;

+ (void)postDataWithUrl:(NSString *)url parms:(NSDictionary *)dic successBlock:(void(^)(id json))successBlock failBlock:(void(^)(id json))failBlock;

@end
