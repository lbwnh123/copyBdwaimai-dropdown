//
//  BWTableviewHeaderViewController.m
//  learnTableviewHeader
//
//  Created by bowen.liu on 15/12/23.
//  Copyright © 2015年 easyDevice. All rights reserved.
//

//-------------------获取设备大小-------------------------
//NavBar高度



#import "BWTableviewHeaderViewController.h"
#import "BWHeaderView.h"
#import "BWCommonHeader.h"

@interface BWTableviewHeaderViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) BWHeaderView * myHeaderView;

@property (nonatomic,strong) NSMutableArray * myData;

@end

@implementation BWTableviewHeaderViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.myData = [NSMutableArray array];
    [self.myData addObject:@"老数据1"];
    [self.myData addObject:@"老数据2"];
    [self.myData addObject:@"老数据3"];
    
    
    self.myHeaderView = [[BWHeaderView alloc] init];
    self.myHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
    [self.view addSubview:self.myHeaderView];
    
    CGFloat tableY = CGRectGetMaxY(self.myHeaderView.frame);
    CGFloat tableHeight = SCREEN_HEIGHT - tableY;
    CGRect tableRect =  CGRectMake(0, tableY, SCREEN_WIDTH, tableHeight);
    self.myTableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStylePlain];
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    
    [self.myTableView reloadData];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > -100) {
        CGPoint scrollViewOffsetPoint = scrollView.contentOffset;
        self.myHeaderView.frame = CGRectMake(0,0, SCREEN_WIDTH, -(scrollViewOffsetPoint.y));
        [self.myHeaderView setNeedsDisplay];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGPoint scrollViewOffsetPoint = scrollView.contentOffset;
    if (-(scrollViewOffsetPoint.y) > 80) {
        self.myHeaderView.tableReflash = YES;
        [self.myTableView setContentOffset:CGPointMake(0, -5) animated:YES];
    }
}


-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //在这里修改scrollView的内容或者其他什么东西
    //NSLog(@"这个事真的结束了");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            if (self.myHeaderView.tableReflash == YES) {
                [self.myHeaderView removeProgressViewandAnimal];
                [self.myTableView setContentOffset:CGPointMake(0, 0) animated:YES];
                self.myHeaderView.tableReflash = NO;
                
                [self.myData addObject:@"新数据1"];
                [self.myTableView reloadData];
            }
        });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.textLabel.text = self.myData[indexPath.row];
    return cell;

}


@end
