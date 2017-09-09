//
//  TableViewController.m
//  CircleTableViewCell
//
//  Created by tom on 08/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:tableViewCellIdentifier];
}

- (void)feedWithCell:(UITableViewCell*)cell fraction:(CGFloat)fraction {
    if ([cell isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)cell;
        TableViewCell *cell_ = dic[@"cell"];
        CGFloat fraction_ = [dic[@"fraction"] floatValue];
        
        [cell_ setFraction:fraction_];
        return;
    }
    [((TableViewCell*)cell) setFraction:fraction];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 999;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier
                                                          forIndexPath:indexPath];
    /**
     随机小数精度
-----------------------------------------------
     十分位精度：* 100 / 100
     百分位精度：* 1000 / 1000
     千分位精度：* 10000 / 10000
     */
    CGFloat fraction = arc4random() % 1000 / 1000.0;
    NSDictionary *feed = @{
                           @"cell" : cell,
                           @"fraction" : @(fraction),
                           };
    [self performSelector:@selector(feedWithCell:fraction:) withObject:feed afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
//    cell.fraction = fraction;
    return cell;
}

@end
