//
//  XRFunnyImageTableViewCell.h
//  jokebook
//
//  Created by ruizhao xie on 15/12/8.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRFunnyImage.h"
#import <YYWebImage/YYWebImage.h>

@protocol XRFunnyImageCellDelegate <NSObject>

-(void)selectedImageViewToCell:(UITableViewCell*)cell;

@end

@interface XRFunnyImageTableViewCell : UITableViewCell



@property (weak, nonatomic) IBOutlet YYAnimatedImageView *FunnyImageView;

@property (weak, nonatomic) IBOutlet UILabel *funnyLable;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property(nonatomic,assign)id<XRFunnyImageCellDelegate> delegate;


- (void)createXRFunnyImageTableViewCellWithXRFunnyImage:(XRFunnyImage *)funnyImage;

@end
