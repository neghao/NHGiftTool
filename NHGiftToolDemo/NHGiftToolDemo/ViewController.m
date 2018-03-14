//
//  ViewController.m
//  NHGiftToolDemo
//
//  Created by neghao on 2018/2/16.
//  Copyright © 2018年 neghao.studio All rights reserved.
//

#import "ViewController.h"
#import "NHGiftView.h"
#import <Masonry.h>
#import <NHExtension/NHUIKit.h>
#import "NHGiftHelper.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backGroundView;
@property (weak, nonatomic) IBOutlet NHGiftView *giftView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *giftViewHeight;
@property (nonatomic, strong) NHGiftHelper *giftHelper;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self changeGiftViewConstraint];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    _giftHelper = [[NHGiftHelper alloc] init];
    _giftHelper.giftView = _giftView;
    [_giftView setBackgroundColor:[UIColor redColor]];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self changeGiftViewConstraint];
}


- (void)changeGiftViewConstraint {
    _giftViewHeight.constant = -(self.view.height * 0.65);
    
    [UIView animateWithDuration:1.2 animations:^{
        [_giftView layoutIfNeeded];
    }];
}


- (IBAction)sendGiftAction:(UIButton *)sender {
    NHGiftModel *model = [[NHGiftModel alloc] init];
    
    model.ID = sender.tag;
    
    [_giftHelper  sengGiftWithModel:model];
    
}

@end
