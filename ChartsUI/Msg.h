//
//  Msg.h
//  ChartsUI
//
//  Created by Sharker on 2021/10/5.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, MsgType) {
    MsgReceive = 0,
    MsgSend
};

NS_ASSUME_NONNULL_BEGIN

@interface Msg : NSObject
- (void)configMsg:(NSString *)content MsgType:(MsgType)type;
- (NSString *)content;
- (MsgType)type;

@end

NS_ASSUME_NONNULL_END
