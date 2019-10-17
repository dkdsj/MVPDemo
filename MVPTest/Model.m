//
//  Model.m
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)modelWithName:(NSString *)name num:(NSString *)num {
    Model *m = [Model new];
    m.name = name;
    m.num = num;
    return m;
}

@end
