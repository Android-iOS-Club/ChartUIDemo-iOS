//
//  ViewController.m
//  ChartsUI
//
//  Created by Sharker on 2021/10/1.
//

#import "ViewController.h"
#import "ChartsCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "Msg.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
static NSString *const chartsCollectionCell = @"ChartsCollectionViewCell";

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<Msg *> *msgList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configContentData];
    [self setupContentUI];
    
}

- (void)configContentData {
    // 初始化聊天数据
    [self initMsgList];
}

- (void)setupContentUI {
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-self.view.safeAreaInsets.bottom);
    }];
}

- (void)initMsgList {
    for (NSUInteger i = 0; i < 10; i++) {
        Msg *msgReceive = [[Msg alloc] init];
        [msgReceive configMsg:[NSString stringWithFormat:@"%lu 你好", (unsigned long)i] MsgType:MsgReceive];
        
        Msg *msgSend = [[Msg alloc] init];
        [msgSend configMsg:[NSString stringWithFormat:@"%lu Hello", (unsigned long)i] MsgType:MsgSend];
        
        [self.msgList addObject:msgReceive];
        [self.msgList addObject:msgSend];
    }
    NSString *string = @"瓦达登记卡数据库就卡视角等卡里就撒看的见颗粒剂阿喀琉斯进口量的撒健康第六届奥斯卡了解到颗粒剂看来大家AFK理解的开始链接代课老师就看拉丝机大控件萨克雷电接口哎纠结看到了萨芬接口来点击访客两件事打开接口来撒旦教风口浪尖控件啊圣诞快乐荆防颗粒啊据说颗粒剂三；来看的杰卡斯；链接打开垃圾分类卡机的反馈了就看拉丝机大开饭了就开始了大家分开了家少得可怜放假看";
    Msg *msg = [[Msg alloc] init];
    [msg configMsg:string MsgType:MsgSend];
//    [self.msgList addObject:msg];
}


#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.msgList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChartsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:chartsCollectionCell forIndexPath:indexPath];
    [cell configUIWith:self.msgList[indexPath.row]];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}


#pragma mark - Accessor
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 200);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = YES;
        [_collectionView registerClass:[ChartsCollectionViewCell class] forCellWithReuseIdentifier:chartsCollectionCell];
    }
    return _collectionView;
}

- (NSMutableArray<Msg *> *)msgList {
    if (!_msgList) {
        _msgList = [NSMutableArray arrayWithCapacity:10];
    }
    return _msgList;
}



@end
