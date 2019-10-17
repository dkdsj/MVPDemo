//
//  MyTableViewCell.h
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbNum;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<PresentProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
