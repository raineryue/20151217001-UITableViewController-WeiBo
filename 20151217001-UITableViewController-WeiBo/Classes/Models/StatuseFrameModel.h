//
//  StatuseFrameModel.h
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//


@class StatuseModel;

@interface StatuseFrameModel : NSObject

/** 微博正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 用户头像 */
@property (nonatomic, assign) CGRect iconFrame;
/** 微博配图 */
@property (nonatomic, assign) CGRect pictureFrame;
/** 用户名称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 是否会员 */
@property (nonatomic, assign) CGRect vipFrame;

/** 微博信息 */
@property (nonatomic, strong) StatuseModel *statuse;

@end
