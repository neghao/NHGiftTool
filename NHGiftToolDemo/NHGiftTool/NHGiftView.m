//
//  NHGiftView.m
//  NHGiftToolDemo
//
//  Created by neghao on 2018/2/16.
//  Copyright © 2018年 neghao.studio All rights reserved.
//

#import "NHGiftView.h"
#import "NHGiftUnitView.h"
#import "NHGiftModel.h"
#import <Masonry.h>

@interface NHGiftView ()
@property (nonatomic, strong) NHGiftUnitView *giftUnitView;
@property (nonatomic, strong) NSMutableArray<NHGiftUnitView*> *unitViews;
@property (nonatomic, strong) NSMutableDictionary *unitViewConstraints;
@property (nonatomic, strong) NSMutableArray *receiveGifts;
@end

@implementation NHGiftView

- (void)receiveGift:(NHGiftModel *)model {
    [self.receiveGifts addObject:model];
    
    NHGiftUnitView* giftUnitView;
    
    giftUnitView = [self.unitViews objectAtIndex:model.ID];
    
    NSString *key = [NSString stringWithFormat:@"%p",giftUnitView];
    NSArray *constraints = [self.unitViewConstraints objectForKey:key];
    
    [self removeConstraints:constraints];
    
    __block NSLayoutConstraint *giftU_L = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    __block NSLayoutConstraint *giftU_R = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    __block NSLayoutConstraint *giftU_T;
    
    if (model.ID == 0) {
        giftU_T = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        
    } else {
        giftU_T = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[self.unitViews objectAtIndex:model.ID-1] attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        
    }
    
    NSLayoutConstraint *giftU_H = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0];
    
    __block NSArray *newConstraints = @[giftU_L, giftU_R, giftU_T, giftU_H];
    [self addConstraints:newConstraints];
    
    [UIView animateWithDuration:1.2 animations:^{
        [self layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [self removeConstraints:newConstraints];
        
        giftU_L = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:-self.bounds.size.width];
        
        giftU_R = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        
        newConstraints = @[giftU_L, giftU_R, giftU_T, giftU_H];
        [self addConstraints:newConstraints];
        [self.unitViewConstraints setObject:newConstraints forKey:key];
        [UIView animateWithDuration:1.2 animations:^{
            [self layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
        }];
    }];

}

- (NSMutableArray *)receiveGifts {
    if (!_receiveGifts) {
        _receiveGifts = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _receiveGifts;
}

- (NSMutableArray *)unitViews {
    if (!_unitViews) {
        _unitViews = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return _unitViews;
}

-(NSMutableDictionary *)unitViewConstraints {
    if (!_unitViewConstraints) {
        _unitViewConstraints = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    return _unitViewConstraints;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initializeViews];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (void)initializeViews {
    NSArray *colors = @[
                        [UIColor blueColor],
                        [UIColor purpleColor],
                        [UIColor brownColor],
                        [UIColor orangeColor]
                        ];
    
    for (NSInteger i = 0; i < 4; i++) {
        
        NHGiftUnitView* giftUnitView = [[NHGiftUnitView alloc] init];
        giftUnitView.backgroundColor = [colors objectAtIndex:i];
        giftUnitView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:giftUnitView];
        [self.unitViews addObject:giftUnitView];
    }
    
    
    [self makeSubviewsConstraints];

}


- (void)layoutSubviews {
    [super layoutSubviews];
//    [self makeSubviewsConstraints];
}


- (void)makeSubviewsConstraints {
    
    NSInteger i = 0;
    
    for (NHGiftUnitView* giftUnitView in self.unitViews) {
        
//        [self removeConstraints:giftUnitView.constraints];

        NSLayoutConstraint *giftU_L = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:-self.bounds.size.width];
        
        NSLayoutConstraint *giftU_R = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        
        NSLayoutConstraint *giftU_T;
        if (i == 0) {
            giftU_T = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
            
        } else {
            giftU_T = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[self.unitViews objectAtIndex:i-1] attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
          
        }
        
        NSLayoutConstraint *giftU_H = [NSLayoutConstraint constraintWithItem:giftUnitView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0];
        
        NSArray *constraints = @[giftU_L, giftU_R, giftU_T, giftU_H];
        [self addConstraints:constraints];
        
        [self.unitViewConstraints setObject:constraints forKey:[NSString stringWithFormat:@"%p",giftUnitView]];
        
        i++;
    }
}

@end
