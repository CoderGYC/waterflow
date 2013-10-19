//
//  MCCollectionViewCell.m
//  pubuliu
//
//  Created by Hilen on 8/31/13.
//  Copyright (c) 2013 KZ. All rights reserved.
//

#import "MCCollectionViewCell.h"

@implementation MCCollectionViewCell{
    CGFloat height;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        height = self.frame.size.height;
    }
    return self;
}

+ (CGFloat)rowHeightForObject:(id)object inColumnWidth:(CGFloat)columnWidth{
    /*
     在这里实现动态高度的计算
     */
    return 160;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
