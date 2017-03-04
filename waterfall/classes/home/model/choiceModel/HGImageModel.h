//
//  HGImageModel.h
//  waterfall
//
//  Created by yangxianggang on 17/3/2.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGImageModel : NSObject

@property (nonatomic,copy) NSString *image_id;
@property (nonatomic,assign) CGFloat image_width;
@property (nonatomic,assign) CGFloat image_height;
@property (nonatomic,copy) NSString *image_original;
@property (nonatomic,copy) NSString *image_middle;
@property (nonatomic,copy) NSString *image_thumbnail;

@end
