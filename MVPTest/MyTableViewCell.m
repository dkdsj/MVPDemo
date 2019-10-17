//
//  MyTableViewCell.m
//  MVPTest
//
//  Created by ZZ on 2019/9/18.
//  Copyright © 2019 ZZ. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()

@property (nonatomic, strong) UIButton *btnMinus;
@property (nonatomic, strong) UIButton *btnPlus;

@end

@implementation MyTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    
    return self;
}

- (void)initView {
    [self.contentView addSubview:self.lbName];
    [self.contentView addSubview:self.lbNum];
    [self.contentView addSubview:self.btnMinus];
    [self.contentView addSubview:self.btnPlus];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.lbName.frame = CGRectMake(0, 0, 100, CGRectGetHeight(self.contentView.frame));
    self.btnMinus.frame = CGRectMake(150, 0, 50, CGRectGetHeight(self.contentView.frame));
    self.lbNum.frame = CGRectMake(200, 0, 50, CGRectGetHeight(self.contentView.frame));
    self.btnPlus.frame = CGRectMake(250, 0, 50, CGRectGetHeight(self.contentView.frame));
}

#pragma mark - Action


- (void)handleButtonEvent:(UIButton *)sender {
    
    NSString *num = self.lbNum.text;
    
    if (sender == _btnMinus) {
        num = [NSString stringWithFormat:@"%d", num.intValue-1];
    } else {
        num = [NSString stringWithFormat:@"%d", num.intValue+1];
    }
    
    NSLog(@"num:%zd row:%zd", num.integerValue, _indexPath.row);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickButtonNum:indexPath:)]) {
        [self.delegate didClickButtonNum:num indexPath:_indexPath];
    }
}



#pragma mark - Getter

- (UILabel *)lbName {
    if (!_lbName) {
        _lbName = [UILabel new];
        _lbName.textAlignment = 1;
    }
    return _lbName;
}

- (UILabel *)lbNum {
    if (!_lbNum) {
        _lbNum = [UILabel new];
        _lbNum.textAlignment = 1;
    }
    return _lbNum;
}

- (UIButton *)btnMinus {
    if (!_btnMinus) {
        _btnMinus = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnMinus setTitle:@"-" forState:UIControlStateNormal];
        [_btnMinus addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        _btnMinus.backgroundColor = [UIColor redColor];
    }
    return _btnMinus;
}

- (UIButton *)btnPlus {
    if (!_btnPlus) {
        _btnPlus = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnPlus setTitle:@"+" forState:UIControlStateNormal];
        [_btnPlus addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        _btnPlus.backgroundColor = [UIColor blueColor];
    }
    return _btnPlus;
}

@end
