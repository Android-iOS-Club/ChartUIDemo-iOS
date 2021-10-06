//
//  ChartsCollectionViewCell.m
//  ChartsUI
//
//  Created by Sharker on 2021/10/5.
//

#import "ChartsCollectionViewCell.h"
#import "Msg.h"
#import <Masonry/Masonry.h>

@interface ChartsCollectionViewCell ()
@property (nonatomic, strong) UIImage *contentBgImage;
@property (nonatomic, strong) UIButton *contentBtn;
@end

@implementation ChartsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupContentUI];
    }
    return self;
}

- (void)setupContentUI {
    [self.contentView addSubview:self.contentBtn];
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width / 2;
    [self.contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_lessThanOrEqualTo(maxWidth);
    }];
    
}

- (void)configUIWith:(Msg *)msg {
    [self.contentBtn setTitle:[msg content] forState:UIControlStateNormal];
    if (msg.type == MsgSend) {
        self.contentBgImage = [UIImage imageNamed:@"right"];
        self.contentBgImage = [self.contentBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(35, 10, 10, 22)];
        self.contentBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-20);
        }];
    } else if (msg.type == MsgReceive) {
        self.contentBgImage = [UIImage imageNamed:@"left"];
        self.contentBgImage = [self.contentBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(35, 22, 10, 10)]; // 默认使用的是平铺的模式
        [self.contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.left.mas_equalTo(20);
        }];
    }
    
    [self.contentBtn setBackgroundImage:self.contentBgImage forState:UIControlStateNormal];
    [self.contentBtn.titleLabel sizeToFit];
}

#pragma mark - Accesstor
- (UIImage *)contentBgImage {
    if (!_contentBgImage) {
        _contentBgImage = [[UIImage alloc] init];
    }
    return _contentBgImage;
}

- (UIButton *)contentBtn {
    if (!_contentBtn) {
        _contentBtn = [UIButton new];
        [_contentBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _contentBtn.titleLabel.numberOfLines = 0;
        _contentBtn.highlighted = NO;
    }
    return _contentBtn;
}

@end
