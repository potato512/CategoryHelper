//
//  UITableView+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SYCategory)

/// 设置列表视图cell分割线缩进样式
- (void)tableViewCellSeparatorInset:(UIEdgeInsets)edge;

/// 隐藏无用的多余单元格
- (void)hiddenUselessTableViewCell;

/**
 *  刷新列表信息（为空时的提示信息）
 *
 *  @param dataSource 数据源
 *  @param tableview  影响的列表视图
 *  @param message    提示信息
 */
+ (void)refreshTableView:(NSArray *)dataSource tabelview:(UITableView *)tableview message:(NSString *)message;

@end
