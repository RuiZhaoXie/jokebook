//
//  XRJokeTableViewCell.h
//  jokebook
//
//  Created by ruizhao xie on 15/12/6.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRJoke.h"

@interface XRJokeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

-(void)createXRJokeTableViewCellWithXRJoke:(XRJoke *)joke;
@end
