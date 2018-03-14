//
//  NHGiftHelper.h
//  NHGiftToolDemo
//
//  Created by neghao on 2018/2/18.
//  Copyright © 2018年 neghao.studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NHGiftView.h"
#import "NHGiftModel.h"

@interface NHGiftHelper : NSObject

@property (weak, nonatomic) IBOutlet NHGiftView *giftView;


- (void)sengGiftWithModel:(NHGiftModel *)model;



@end
