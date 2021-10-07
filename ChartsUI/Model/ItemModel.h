//
//  ItemModel.h
//  ChartsUI
//
//  Created by Sharker on 2021/10/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Msg.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemModel : NSObject
@property (nonatomic, strong) Msg *msg;
@property (nonatomic, assign) CGFloat itemHeight;
@end

NS_ASSUME_NONNULL_END
