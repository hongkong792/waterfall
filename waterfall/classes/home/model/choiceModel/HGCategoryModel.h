//
//  HGCategoryModel.h
//  waterfall
//
//  Created by yangxianggang on 17/3/2.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGImageModel.h"

@interface HGCategoryModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *cate_type;
@property (nonatomic,strong)HGImageModel *image;


@end
