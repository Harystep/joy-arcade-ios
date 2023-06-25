//
//  YCJSettingCell.h
//  YCJieJiGame
//
//  Created by zza on 2023/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YCJMineInfoModel;
@interface YCJSettingCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) YCJMineInfoModel *settingInfoModel;
@end

NS_ASSUME_NONNULL_END
