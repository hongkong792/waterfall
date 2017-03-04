//
//  MainTableViewCell.h
//  waterfall
//
//  Created by yangxianggang on 17/2/26.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indentifier:(NSString *)indentifier;

@property (nonatomic,strong) HGGoodsFrame *goodsFrame;
@end
