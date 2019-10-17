//
//  Present.m
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import "Present.h"
#import <UIKit/UIKit.h>

@implementation Present

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.baseItems = [NSMutableArray array];
    
    NSArray *items = @[@{@"name": @"A", @"num": @"9"},
                       @{@"name": @"B", @"num": @"9"},
                       @{@"name": @"C", @"num": @"9"},
                       @{@"name": @"D", @"num": @"9"},
                       @{@"name": @"E", @"num": @"9"},
                       @{@"name": @"F", @"num": @"9"},
                       @{@"name": @"G", @"num": @"9"},
                       ];
    for (NSDictionary *dic in items) {
        [_baseItems addObject:[Model modelWithName:dic[@"name"] num:dic[@"num"]]];
    }
    
}

#pragma mark - PresentProtocol

- (void)didClickButtonNum:(NSString *)num indexPath:(NSIndexPath *)indexPath {
    
    @synchronized (self) {
        if (indexPath.row < self.baseItems.count) {
            Model *model = _baseItems[indexPath.row];
            model.num = num;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUIData)]) {
                [self.delegate reloadUIData];
            }
        }
    }
}



@end
