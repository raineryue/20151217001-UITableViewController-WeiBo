//
//  StatuseTableViewCell.h
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatuseFrameModel;

@interface StatuseTableViewCell : UITableViewCell

/** 微博信息 */
@property (nonatomic, strong) StatuseFrameModel *statuseFrame;

/**
 *  初始化一个表格行（对象方法）
 */
- (instancetype)initStatuseTableViewCellWithTableView:(UITableView *)tableView;

/**
 *  初始化一个表格行（类方法）
 */
+ (instancetype)statuseTableViewCellWithTableView:(UITableView *)tableView;

@end
