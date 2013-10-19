//
//  MyClosetCell.m
//  MyShow
//
//  Created by Hilen on 8/31/13.
//

#import "MyClosetCell.h"

@implementation MyClosetCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (CGFloat)rowHeightForObject:(id)object inColumnWidth:(CGFloat)columnWidth{
    /*
     在这里实现动态高度的计算
     */
    return 90;
}

@end
