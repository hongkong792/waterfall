//
//  HttpTool.m
//  waterfall
//
//  Created by 杨香港 on 2017/3/2.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "HttpTool.h"
#import "HttpBaseMethod.h"

@implementation HttpTool

+(void)dataWithUrl:(NSString *)url prams:(NSDictionary *)dic success:(successBlock)success failure:(failureBlock)faliure
{
  [HttpBaseMethod getDataWithUrl:url parms:dic successBlock:^(id json) {
      if (success) {
          success(json);
      }
  } failBlock:^(id json) {
      faliure(json);
  }];
    
    
}

@end
