//
//  TBDataSource.h
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ConfigBlock)(id cell, id model, NSIndexPath *indexPath);

@interface TBDataSource : NSObject


- (instancetype)initWithIdentifier:(NSString *)identifier view:(UIView *)view configureBlock:(ConfigBlock)configureBlock;

- (void)addDataArray:(NSMutableArray *)array;
                                                                        

@end

NS_ASSUME_NONNULL_END
