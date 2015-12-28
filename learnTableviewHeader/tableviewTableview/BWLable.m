//
//  BWLable.m
//  learnTableviewHeader
//
//  Created by bowen.liu on 15/12/28.
//  Copyright © 2015年 easyDevice. All rights reserved.
//

#import "BWLable.h"

@implementation BWLable

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setText:(NSString *)text
{
    
    [super setText:text];
    
    UIFont * tfont = [UIFont systemFontOfSize:19];
    
    self.font = tfont;
    
    self.textColor = [UIColor whiteColor];
    
    CGSize size =CGSizeMake(300,50);
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,nil];
    
    CGSize  actualsize =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    
    self.bounds = CGRectMake(0, 0, actualsize.width, actualsize.height);

}

@end
