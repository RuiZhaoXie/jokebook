//
//  XRFunnyImageTableViewController.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/8.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRFunnyImageTableViewController.h"
#import "UITableViewController+MJRefresh.h"
#import "XRHttpRequest.h"
#import "XRFunnyImageTableViewCell.h"
#import "XRFunnyImage.h"
#import "URBMediaFocusViewController.h"//弹出图片控制器
#define K_MIN_NUM 1
@interface XRFunnyImageTableViewController ()<XRFunnyImageCellDelegate,URBMediaFocusViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray * funnyImages;

@property (nonatomic,assign)NSUInteger refrechCount;

@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusViewController;
@end

@implementation XRFunnyImageTableViewController

//懒加载
-(NSMutableArray *)funnyImages
{
    if (!_funnyImages) {
        _funnyImages = [NSMutableArray array];
    }
    return _funnyImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:true];
    
    [self startMJRefreshWithPage:K_MIN_NUM];

}

-(void)loadDataWithPage:(NSUInteger)page
{
    [super loadDataWithPage:page];
    self.refrechCount = page;
    __weak XRFunnyImageTableViewController * weakSelf = self;
    [XRHttpRequest requestFunnyImageByPage:page Complation:^(NSArray *relusts) {
        [weakSelf endMJRefreshingWithPage:page andData: weakSelf.funnyImages andAddData:relusts];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.view = nil;
}

#pragma mark - XRFunnyImageCellDelegate
-(void)selectedImageViewToCell:(UITableViewCell *)cell
{
    XRFunnyImageTableViewCell *cel = (XRFunnyImageTableViewCell *)cell;
    URBMediaFocusViewController *controller = [[URBMediaFocusViewController alloc] init];
    [controller showImage:cel.FunnyImageView.image fromView:self.view inViewController:self];
    controller.delegate = self;
    self.mediaFocusViewController = controller;
}

#pragma mark URBMediaFocusViewControllerDelegate

- (void)mediaFocusViewControllerDidDisappear:(URBMediaFocusViewController *)mediaFocusViewController {
    self.mediaFocusViewController = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.funnyImages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRFunnyImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];

    cell.delegate = self;
    [cell createXRFunnyImageTableViewCellWithXRFunnyImage:self.funnyImages[indexPath.row]];
    return cell;
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
