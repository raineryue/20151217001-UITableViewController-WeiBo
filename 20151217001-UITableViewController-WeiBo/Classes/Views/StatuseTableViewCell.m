//
//  StatuseTableViewCell.m
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "StatuseTableViewCell.h"
#import "StatuseFrameModel.h"

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
        iconImageView.backgroundColor = [UIColor redColor];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:self.iconImageView];
        
        // 用户名称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.backgroundColor = [UIColor grayColor];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:self.nameLabel];
        
        // 会员图标
        UIImageView *vipImageView = [[UIImageView alloc] init];
        self.vipImageView = vipImageView;
        [self.contentView addSubview:self.vipImageView];
        
        // 微博正文
        UILabel *statuseLabel = [[UILabel alloc] init];
        
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

- (void)setStatuseFrame:(StatuseFrameModel *)statuseFrame {
    _statuseFrame = statuseFrame;
    
    [self subviewsLayoutWithStatuseFrame:statuseFrame];
    
    [self subviewsDataWithStatuse:statuseFrame.statuse];
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
}

/**
 *  布局控件的位置大小
 */
- (void)subviewsDataWithStatuse:(StatuseModel *)statuse {
    // 头像
    self.iconImageView.image = [UIImage imageNamed:statuse.icon];
    
    // 名称
    self.nameLabel.text = statuse.name;
}

@end
