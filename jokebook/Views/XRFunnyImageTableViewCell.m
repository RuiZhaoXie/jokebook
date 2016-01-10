//
//  XRFunnyImageTableViewCell.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/8.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRFunnyImageTableViewCell.h"
#import <UIImageView+WebCache.h>


@implementation XRFunnyImageTableViewCell
//这个方法只在初始化的时候调用,relodata不调用
- (void)awakeFromNib {
    //点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    //设置圆角
    [self.FunnyImageView.layer setCornerRadius:5];
    //开启图片的交互
    [self.FunnyImageView setUserInteractionEnabled:YES];
    //添加点击手势到图片
    [self.FunnyImageView addGestureRecognizer:tap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)tapImageView:(UITapGestureRecognizer *)tap
{
    //判断代理方法是否存在
    if ([self.delegate respondsToSelector:@selector(selectedImageViewToCell:)]) {
        [self.delegate selectedImageViewToCell:self];
    }
}

- (void)createXRFunnyImageTableViewCellWithXRFunnyImage:(XRFunnyImage *)funnyImage
{
    self.funnyLable.text = funnyImage.content;
    self.timeLabel.text = funnyImage.updatetime;
    //用YYWebImage加载动态图片
//    self.FunnyImageView.yy_imageURL = [NSURL URLWithString:funnyImage.url];
    
    [self.FunnyImageView yy_setImageWithURL:[NSURL URLWithString:funnyImage.url] placeholder:[UIImage imageNamed:@"default"] options:YYWebImageOptionUseNSURLCache completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
        
    }];
  
}




-(void)layoutSubviews{
    [super layoutSubviews];
    //图片启动动画再考虑,暂时这样
    [self.FunnyImageView startAnimating];
}

@end
