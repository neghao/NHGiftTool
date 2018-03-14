//
//  NHGiftModel.h
//  NHGiftToolDemo
//
//  Created by neghao on 2018/2/16.
//  Copyright © 2018年 neghao.studio All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHGiftModel : NSObject
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *senderID;
@property (nonatomic, copy) NSString *receiveID;
@property (nonatomic, assign) NSInteger count;

@end
