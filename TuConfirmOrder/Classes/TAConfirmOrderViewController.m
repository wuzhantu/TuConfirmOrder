//
//  TAConfirmOrderViewController.m
//  Target-Action
//
//  Created by 上海彭于晏 on 2018/4/2.
//  Copyright © 2018年 上海彭于晏. All rights reserved.
//

#import "TAConfirmOrderViewController.h"
#import "CTMediator+TAConfirmOrder.h"
@interface TAConfirmOrderViewController ()
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation TAConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.sureButton];
    
    self.navigationItem.title = [NSString stringWithFormat:@"确认订单(%@)",self.goodsName];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.sureButton.frame = CGRectMake(0, 0, 100, 100);
    self.sureButton.center = self.view.center;
}
- (void)didClickSureButton:(UIButton *)button
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.confirmComplete) {
                self.confirmComplete();
            }
        }];
    }
}

#pragma mark - getters
- (UIButton *)sureButton
{
    if (_sureButton == nil) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"立即下单" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _sureButton.backgroundColor = [UIColor yellowColor];
        [_sureButton addTarget:self action:@selector(didClickSureButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

@end
