//
//  StatuseFrameModel.m
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "StatuseFrameModel.h"
#import "StatuseModel.h"

@implementation StatuseFrameModel

/**
 *  复写微博信息的setter方法，设置控件的位置
 */
- (void)setStatuse:(StatuseModel *)statuse {
    _statuse = statuse;
    
    // 用户头像位置大小
    CGFloat iconX = kTableViewCellContentMargin;
    CGFloat iconY = kTableViewCellContentMargin;
    CGFloat iconW = kUserIconWH;
    CGFloat iconH = kUserIconWH;
    
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 用户名称位置大小
    CGRect nameFrame = [statuse.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kUserNameFontSize} context:nil];
    
    nameFrame.origin.x = CGRectGetMaxX(self.iconFrame) + kTableViewCellContentMargin;
    nameFrame.origin.y = (iconH - nameFrame.size.height) * 0.5 + kTableViewCellContentMargin;
    
    self.nameFrame = nameFrame;
    
    // 会员位置大小
    CGFloat vipX = CGRectGetMaxX(self.nameFrame) + kTableViewCellContentMargin;
    CGFloat vipY = self.nameFrame.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    
    self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文位置大小
    // 这里用来算文字在固定宽度下的大小
    CGRect textFrame = [statuse.text boundingRectWithSize:CGSizeMake((kScreenWidth - kTableViewCellContentMargin * 2), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kTextFontSize} context:nil];
    
    textFrame.origin.x = kTableViewCellContentMargin;
    textFrame.origin.y = CGRectGetMaxY(self.iconFrame) + kTableViewCellContentMargin;

    self.textFrame = textFrame;
    
    // 配图位置大小
    CGFloat pictureX = kTableViewCellContentMargin;
    CGFloat pictureY = CGRectGetMaxY(self.textFrame) + kTableViewCellContentMargin;
    CGFloat pictureW = 100;
    CGFloat pictureH = 100;
    
    self.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    // 单元格高
    if (statuse.picture.length > 0)
        self.rowHeight = CGRectGetMaxY(self.pictureFrame) + kTableViewCellContentMargin;
    else
        self.rowHeight = CGRectGetMaxY(self.textFrame) + kTableViewCellContentMargin;
}

/**
 *  类描述方法
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>:{textFrame: %@, iconFrame: %@, pictureFrame: %@, nameFrame: %@, vipFrame: %@, statuse: %@}", self.class, self, NSStringFromCGRect(self.textFrame), NSStringFromCGRect(self.iconFrame), NSStringFromCGRect(self.pictureFrame), NSStringFromCGRect(self.nameFrame), NSStringFromCGRect(self.vipFrame), self.statuse];
}

@end
