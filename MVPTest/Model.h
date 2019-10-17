//
//  Model.h
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *num;

+ (instancetype)modelWithName:(NSString *)name num:(NSString *)num;

@end

NS_ASSUME_NONNULL_END
