//
//  PresentProtocol.h
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PresentProtocol <NSObject>

@optional

- (void)didClickButtonNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;
- (void)reloadUIData;

@end

NS_ASSUME_NONNULL_END
