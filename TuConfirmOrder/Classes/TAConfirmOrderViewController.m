//
//  TAConfirmOrderViewController.m
//  Target-Action
//
//  Created by 上海彭于晏 on 2018/4/2.
//  Copyright © 2018年 上海彭于晏. All rights reserved.
//

#import "TAConfirmOrderViewController.h"
#import "CTMediator+TAGoodsDetail.h"

@interface TAConfirmOrderViewController ()
@property (nonatomic, strong) UIButton *sureButton; //确认按钮

@end

@implementation TAConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    //其实这才是最新提交
    [self.view addSubview:self.sureButton];
    
    self.navigationItem.title = [NSString stringWithFormat:@"确认订单(%@)",self.goodsName];
    
    UIImageView *imgView = [[UIImageView alloc]
                            initWithFrame:CGRectMake(50, 100, 100, 100)];
    imgView.backgroundColor = [UIColor redColor];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"TuConfirmOrder" withExtension:@"bundle" subdirectory:nil];
    NSBundle *myBundle = [NSBundle bundleWithURL:url];
    if (@available(iOS 13.0, *)) {
        imgView.image = [UIImage imageNamed:@"ic_more" inBundle:myBundle withConfiguration:nil];
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:imgView];
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
