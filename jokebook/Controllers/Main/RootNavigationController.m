//
//  RootNavigationController.m
//  jokebook
//
//  Created by YUYE on 15/12/2.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
   //设置左右Item颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    //设置navigationBar背景图
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
