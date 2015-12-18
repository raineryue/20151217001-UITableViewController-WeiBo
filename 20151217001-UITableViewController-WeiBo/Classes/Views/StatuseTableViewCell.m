//
//  StatuseTableViewCell.m
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "StatuseTableViewCell.h"
#import "StatuseFrameModel.h"
#import "StatuseModel.h"

@interface StatuseTableViewCell ()

/** 用户头像 */
@property (nonatomic, weak) UIImageView *iconImageView;
/** 用户名称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 会员图标 */
@property (nonatomic, weak) UIImageView *vipImageView;
/** 微博正文 */
@property (nonatomic, weak) UILabel *statuseLabel;
/** 微博配图 */
@property (nonatomic, weak) UIImageView *pictureImageView;

@end

@implementation StatuseTableViewCell

#pragma mark - 初始化方法
/**
 *  初始化一个表格行（对象方法）
 */
- (instancetype)initStatuseTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *tableViewCellIdtentifier = @"statuseTableViewCellIdtentifier";
    
    StatuseTableViewCell *statuseTableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdtentifier];
    
    if (nil == statuseTableViewCell) {
        statuseTableViewCell = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdtentifier];
    }
    
    return statuseTableViewCell;
}

/**
 *  初始化一个表格行（类方法）
 */
+ (instancetype)statuseTableViewCellWithTableView:(UITableView *)tableView {
    return [[StatuseTableViewCell alloc] initStatuseTableViewCellWithTableView:tableView];
}

/**
 *  复写表格行控件的初始化方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 用户头像
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:self.iconImageView];
        
        // 用户名称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = kUserNameFontSize;
        self.nameLabel = nameLabel;
        [self.contentView addSubview:self.nameLabel];
        
        // 会员图标
        UIImageView *vipImageView = [[UIImageView alloc] init];
        self.vipImageView = vipImageView;
        [self.contentView addSubview:self.vipImageView];
        
        // 微博正文
        UILabel *statuseLabel = [[UILabel alloc] init];
        statuseLabel.font = kTextFontSize;
        statuseLabel.numberOfLines = 0;
        self.statuseLabel = statuseLabel;
        [self.contentView addSubview:self.statuseLabel];
        
        // 微博配图
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        
        self.pictureImageView = pictureImageView;
        [self.contentView addSubview:self.pictureImageView];
    }
    
    return self;
}

#pragma mark - 属性setter复写
/**
 *  复写微博单元格位置属性
 */
- (void)setStatuseFrame:(StatuseFrameModel *)statuseFrame {
    _statuseFrame = statuseFrame;
    
    // 填充控件数据
    [self subviewsDataWithStatuse:statuseFrame.statuse];
    
    // 布局控件位置
    [self subviewsLayoutWithStatuseFrame:statuseFrame];
}

#pragma mark - 私有辅助方法
/**
 *  布局控件的位置大小
 */
- (void)subviewsLayoutWithStatuseFrame:(StatuseFrameModel *)statuseFrame {
    // 头像
    self.iconImageView.frame = statuseFrame.iconFrame;
    
    // 名称
    self.nameLabel.frame = statuseFrame.nameFrame;
    
    // 会员
    self.vipImageView.frame = statuseFrame.vipFrame;
    
    // 正文
    self.statuseLabel.frame = statuseFrame.textFrame;
    
    // 配图
    self.pictureImageView.frame = statuseFrame.pictureFrame;
}

/**
 *  填充控件上的数据
 */
- (void)subviewsDataWithStatuse:(StatuseModel *)statuse {
    // 头像
    self.iconImageView.image = [UIImage imageNamed:statuse.icon];
    
    // 名称
    self.nameLabel.text = statuse.name;
    
    // 会员
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    
    if (statuse.isVip)
        self.vipImageView.hidden = NO;
    else
        self.vipImageView.hidden = YES;
    
    // 正文
    self.statuseLabel.text = statuse.text;
    
    // 配图
    if (statuse.picture.length > 0) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:statuse.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
}

@end
