//
//  XRJokeTableViewCell.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/6.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRJokeTableViewCell.h"

@implementation XRJokeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)createXRJokeTableViewCellWithXRJoke:(XRJoke *)joke {
    self.jokeLabel.text = joke.content;
    self.timeLabel.text = [NSString stringWithFormat:@"%@",joke.updatetime];
}


@end
