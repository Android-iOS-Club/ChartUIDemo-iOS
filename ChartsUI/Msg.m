//
//  Msg.m
//  ChartsUI
//
//  Created by Sharker on 2021/10/5.
//

#import "Msg.h"
@interface Msg()
@property (nonatomic, assign) MsgType type;
@property (nonatomic, copy) NSString *content;
@end

@implementation Msg

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)configMsg:(NSString *)content MsgType:(MsgType)type {
    self.content = content;
    self.type = type;
}

@end
