//
//  StatuseModel.m
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "StatuseModel.h"

@implementation StatuseModel
/**
 *  根据自定初始化一个当前对象（对象方法）
 */
- (instancetype)initStatuseWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  根据自定初始化一个当前对象（类方法）
 */
+ (instancetype)statuseWithDictionary:(NSDictionary *)dictionary {
    return [[StatuseModel alloc] initStatuseWithDictionary:dictionary];
}

/**
 *  获取该类数组（对象方法）
 */
- (NSArray *)statuseArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Statuses" ofType:@"plist"]];
    
    __block NSMutableArray *statuseArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [statuseArray addObject:[StatuseModel statuseWithDictionary:obj]];
    }];
    
    return statuseArray;
}

/**
 *  获取该类数组（类方法）
 */
+ (NSArray *)statuseArray {
    return [[StatuseModel alloc] statuseArray];
}

@end
