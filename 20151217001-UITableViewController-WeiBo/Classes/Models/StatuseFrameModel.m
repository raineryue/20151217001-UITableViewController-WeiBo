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
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + kTableViewCellContentMargin;
    CGFloat nameY = kTableViewCellContentMargin;
    
    CGSize nameSize = [statuse.name sizeWithAttributes:@{@"NSFontAttributeName":[UIFont systemFontOfSize:kUserNameFontSize]}];
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    
    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    // 会员位置大小
    CGFloat vipX = kTableViewCellContentMargin;
    CGFloat vipY = kTableViewCellContentMargin;
    CGFloat vipW = kUserIconWH;
    CGFloat vipH = kUserIconWH;
    
    self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文位置大小
    CGFloat textX = kTableViewCellContentMargin;
    CGFloat textY = kTableViewCellContentMargin;
    CGFloat textW = kUserIconWH;
    CGFloat textH = kUserIconWH;
    
    self.textFrame = CGRectMake(textX, textY, textW, textH);
    
    // 配图位置大小
    CGFloat pictureX = kTableViewCellContentMargin;
    CGFloat pictureY = kTableViewCellContentMargin;
    CGFloat pictureW = kUserIconWH;
    CGFloat pictureH = kUserIconWH;
    
    self.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
}

/**
 *  类描述方法
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>:{textFrame: %@, iconFrame: %@, pictureFrame: %@, nameFrame: %@, vipFrame: %@, statuse: %@}", self.class, self, NSStringFromCGRect(self.textFrame), NSStringFromCGRect(self.iconFrame), NSStringFromCGRect(self.pictureFrame), NSStringFromCGRect(self.nameFrame), NSStringFromCGRect(self.vipFrame), self.statuse];
}

@end
