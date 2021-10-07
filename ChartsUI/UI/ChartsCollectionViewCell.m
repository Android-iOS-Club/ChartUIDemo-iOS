//
//  ChartsCollectionViewCell.m
//  ChartsUI
//
//  Created by Sharker on 2021/10/5.
//

#import "ChartsCollectionViewCell.h"
#import "ItemModel.h"
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
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
}

- (void)configUIWith:(ItemModel *)item {
    Msg * msg = item.msg;
    [self.contentBtn setTitle:[msg content] forState:UIControlStateNormal];
    [self.contentBtn.titleLabel sizeToFit];
    if (msg.type == MsgSend) {
        [self updateChartsSendUI];
    } else if (msg.type == MsgReceive) {
        [self updateChartsReceiveUI];
    }
    [self.contentBtn setBackgroundImage:self.contentBgImage forState:UIControlStateNormal];
}

- (void)updateChartsSendUI {
    self.contentBgImage = [UIImage imageNamed:@"right"];
    self.contentBgImage = [self.contentBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(35, 10, 10, 22)];
    CGSize size = [self.contentBtn.titleLabel sizeThatFits:CGSizeMake(MAXWIDTH, 200)];
    [self.contentBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(size.width + 20);
        make.height.mas_equalTo(size.height + 20);
        make.width.mas_lessThanOrEqualTo(MAXWIDTH);
        make.top.bottom.mas_equalTo(0);
    }];
}

- (void)updateChartsReceiveUI {
    self.contentBgImage = [UIImage imageNamed:@"left"];
    self.contentBgImage = [self.contentBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(35, 22, 10, 10)]; // 默认使用的是平铺的模式
    
    CGSize size = [self.contentBtn.titleLabel sizeThatFits:CGSizeMake(MAXWIDTH, 200)];
    [self.contentBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(size.width + 20);
        make.height.mas_equalTo(size.height + 20);
        make.width.mas_lessThanOrEqualTo(MAXWIDTH);
    }];
}

// 预估高度设置
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    // 将真是的高度返回给 layout
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height = size.height;
    layoutAttributes.frame = cellFrame;
    return  layoutAttributes;
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
        _contentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _contentBtn.highlighted = NO;
    }
    return _contentBtn;
}

@end
