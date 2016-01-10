//
//  RootTabBarController.m
//  jokebook
//
//  Created by YUYE on 15/12/1.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "RootTabBarController.h"


@interface RootTabBarController ()



@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabbar背景图片,达到修改背景颜色的效果
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 49)];
    [backgroundImageView setImage:[UIImage imageNamed:@"tabBar"]];
    [self.tabBar insertSubview:backgroundImageView atIndex:0];
    //设置透明
    [self.tabBar setOpaque:true];
    //设置选中时为白色
    [self.tabBar setTintColor:[UIColor whiteColor]];
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
