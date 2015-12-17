//
//  StatuseModel.h
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

@interface StatuseModel : NSObject

/** 微博正文 */
@property (nonatomic, copy) NSString *text;
/** 用户头像 */
@property (nonatomic, copy) NSString *icon;
/** 微博配图 */
@property (nonatomic, copy) NSString *picture;
/** 用户名称 */
@property (nonatomic, copy) NSString *name;
/** 是否会员 */
@property (nonatomic, assign, getter=isVip) BOOL vip;

/**
 *  根据自定初始化一个当前对象（对象方法）
 */
- (instancetype)initStatuseWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据自定初始化一个当前对象（类方法）
 */
+ (instancetype)statuseWithDictionary:(NSDictionary *)dictionary;

/**
 *  获取该类数组（对象方法）
 */
- (NSArray *)statuseArray;

/**
 *  获取该类数组（类方法）
 */
+ (NSArray *)statuseArray;

@end
