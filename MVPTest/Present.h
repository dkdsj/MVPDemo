//
//  Present.h
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresentProtocol.h"
#import "Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface Present : NSObject<PresentProtocol>

@property (nonatomic, strong) NSMutableArray<Model *> *baseItems;
@property (nonatomic, weak) id<PresentProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
