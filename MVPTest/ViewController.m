//
//  ViewController.m
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "PresentProtocol.h"
#import "Model.h"
#import "Present.h"
#import "TBDataSource.h"

@interface ViewController ()<PresentProtocol>

@property (nonatomic, strong) Present *pt;
@property (nonatomic, strong) TBDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)initView {
    self.pt = [[Present alloc] init];
    self.pt.delegate = self;
    
    __weak __typeof(self)weakSelf = self;
    self.dataSource = [[TBDataSource alloc] initWithIdentifier:@"MyTableViewCell" view:self.view configureBlock:^(MyTableViewCell *cell, Model *model, NSIndexPath *indexPath) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        cell.lbNum.text = model.num;
        cell.lbName.text = model.name;
        cell.delegate = strongSelf.pt;
        cell.indexPath = indexPath;
    }];
    [self.dataSource addDataArray:self.pt.baseItems];
}

#pragma mark - PresentProtocol

- (void)reloadUIData {
    [self.dataSource addDataArray:self.pt.baseItems];
}

@end
