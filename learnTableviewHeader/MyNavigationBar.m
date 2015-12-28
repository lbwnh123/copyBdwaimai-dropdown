//
//  MyNavigationBar.m
//  learnTableviewHeader
//
//  Created by bowen.liu on 15/12/23.
//  Copyright © 2015年 easyDevice. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavgationControllerBackView"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.translucent = NO;
    
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

@end
