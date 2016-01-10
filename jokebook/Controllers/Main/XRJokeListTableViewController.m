//
//  XRJokeListTableViewController.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/5.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRJokeListTableViewController.h"
#import "UITableViewController+MJRefresh.h"
#import "XRJokeTableViewCell.h"
#import "XRHttpRequest.h"
#import "XRJoke.h"

#define MIN_NUM 1

@interface XRJokeListTableViewController ()

@property (nonatomic,strong) NSMutableArray * jokes;

@property (nonatomic,assign)NSUInteger refrechCount;  //页数

@property (nonatomic,strong) XRJoke * joke;
@end

@implementation XRJokeListTableViewController

//懒加载
-(NSMutableArray *)jokes {
    if (!_jokes) {
        _jokes = [NSMutableArray array];
    }
    return _jokes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:true];
    [self startMJRefreshWithPage:MIN_NUM];
}

-(void)loadDataWithPage:(NSUInteger)page
{
    [super loadDataWithPage:page];
    self.refrechCount = page;
    __weak XRJokeListTableViewController * weakSelf = self;
    [XRHttpRequest requestJokeByPage:page Complation:^(NSArray *relusts) {
        [weakSelf endMJRefreshingWithPage:page andData: weakSelf.jokes andAddData:relusts];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.view = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.jokes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRJokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
     [cell createXRJokeTableViewCellWithXRJoke:self.jokes[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.joke = self.jokes[indexPath.row];
    NSUInteger  hight = [self getLabelHeightByString:self.joke.content]+40;
    return hight;
}

-(CGFloat)getLabelHeightByString:(NSString *)content
{
    //字体要跟label的字体大小一样[UIFont systemFontOfSize:15]
    CGRect frame = [content boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-20, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    
    return frame.size.height;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
