//
//  ViewController.m
//  20151217001-UITableViewController-WeiBo
//
//  Created by Rainer on 15/12/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "StatuseModel.h"
#import "StatuseFrameModel.h"
#import "StatuseTableViewCell.h"

@interface ViewController ()

/** 微博控件Frame列表 */
@property (nonatomic, strong) NSMutableArray *statuseFrameArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

#pragma mark - 属性懒加载
/**
 *  微博列表属性懒加载
 */
- (NSMutableArray *)statuseFrameArray {
    if (nil == _statuseFrameArray) {
        _statuseFrameArray = [NSMutableArray array];
        
        NSArray *statuseArray = [StatuseModel statuseArray];
        
        [statuseArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            StatuseFrameModel *statuseFrame = [[StatuseFrameModel alloc] init];
            
            statuseFrame.statuse = (StatuseModel *)obj;
            
            [_statuseFrameArray addObject:statuseFrame];
        }];
    }
    
    return _statuseFrameArray;
}

#pragma mark - TableView数据源代理方法
/**
 *  返回每组数据的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuseFrameArray.count;
}

/**
 *  返回表格行
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatuseTableViewCell *statuseTableViewCell = [StatuseTableViewCell statuseTableViewCellWithTableView:tableView];
    
    NSLog(@"%@", self.statuseFrameArray);
    
    statuseTableViewCell.statuseFrame = self.statuseFrameArray[indexPath.row];
    
    return statuseTableViewCell;
}

#pragma mark - TableView代理方法
/**
 *  返回单元格的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatuseFrameModel *statuseFrame = self.statuseFrameArray[indexPath.row];
    
    return statuseFrame.rowHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
