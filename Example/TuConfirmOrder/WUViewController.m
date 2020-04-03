//
//  WUViewController.m
//  TuConfirmOrder
//
//  Created by wuzhantu on 11/05/2019.
//  Copyright (c) 2019 wuzhantu. All rights reserved.
//

#import "WUViewController.h"
#import "CTMediator+TAConfirmOrder.h"

@interface WUViewController ()

@end

@implementation WUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
        UIViewController *confirmOrderVC = [[CTMediator sharedInstance] confirmOrderViewControllerWithGoodsId:@"ddd"
                                                                                                    goodsName:@"ff"
                                                                                              ConfirmComplete:^{
    //        self.statusLabel.text = @"购买成功";
        }];
        if (confirmOrderVC) {
            [self presentViewController:confirmOrderVC animated:YES completion:nil];
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
