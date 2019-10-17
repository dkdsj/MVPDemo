//
//  TBDataSource.m
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import "TBDataSource.h"
#import <UIKit/UIKit.h>

@interface TBDataSource ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tbPresent;

@property (nonatomic, strong) NSString *identify;
@property (nonatomic, copy) ConfigBlock configBlock;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TBDataSource

- (instancetype)initWithIdentifier:(NSString *)identifier view:(UIView *)view configureBlock:(void (^)(id _Nonnull, id _Nonnull, NSIndexPath * _Nonnull))configureBlock {
    self = [super init];
    if (self) {
        [self.tbPresent registerClass:[MyTableViewCell class] forCellReuseIdentifier:identifier];
        [view addSubview:self.tbPresent];
        self.tbPresent.frame = view.frame;

        _configBlock = configureBlock;
        _identify = identifier;
    }
    return self;
}

- (void)addDataArray:(NSMutableArray *)array {
    _items = [NSMutableArray arrayWithArray:array];
    [self.tbPresent reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identify forIndexPath:indexPath];
    
    if (self.configBlock) {
        self.configBlock(cell, _items[indexPath.row], indexPath);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath %zd", indexPath.row);
}

#pragma mark - Getter

- (UITableView *)tbPresent {
    if (!_tbPresent) {
        _tbPresent = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tbPresent.delegate = self;
        _tbPresent.dataSource = self;
        _tbPresent.estimatedRowHeight = 44;
    }
    
    return _tbPresent;
}

@end
