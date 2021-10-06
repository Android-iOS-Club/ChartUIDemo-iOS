//
//  ChartsCollectionViewCell.h
//  ChartsUI
//
//  Created by Sharker on 2021/10/5.
//

#import <UIKit/UIKit.h>
@class Msg;
NS_ASSUME_NONNULL_BEGIN

@interface ChartsCollectionViewCell : UICollectionViewCell
- (void)configUIWith:(Msg *)msg;

@property (nonatomic, copy) void(^contentLongPassBlock)(UILongPressGestureRecognizer *gesture);
@property (nonatomic, copy) void(^coententTapBlock)(UITapGestureRecognizer *gesture);


@end

NS_ASSUME_NONNULL_END
