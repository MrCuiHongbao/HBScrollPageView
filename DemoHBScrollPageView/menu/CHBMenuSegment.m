//
//  CHBMenuSegment.m
//  XiMo
//
//  Created by Founder on 15/12/23.
//  Copyright © 2015年 Founder. All rights reserved.
//

#import "CHBMenuSegment.h"
#import "TitleItemView.h"
#import "UIColor+HTMLColors.h"
//#define INDICATORCOLOR  @"#c30005"
#define INDICATOROFFSET 10
@interface CHBMenuSegment()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *indicatorImageView;
@property(nonatomic,assign)TitleItemView *titleItemView;
@end
@implementation CHBMenuSegment
@synthesize scrollView = _scrollView;
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_scrollView];
        
        _indicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(INDICATOROFFSET+2, frame.size.height-2, 0, 2.0)];
        [_indicatorImageView setBackgroundColor:[UIColor colorWithHexString:THRMECOLOR]];
        [self addSubview:_indicatorImageView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setTitleItem:(NSArray *)array{
    _totoalPage = [array count];
    for (NSInteger i=0; i<_totoalPage; i++) {
        NSDictionary *dict = [array objectAtIndex:i];
        NSString *title = [dict objectForKey:@"title"];
        NSString *number = [dict objectForKey:@"number"];
        TitleItemView *itemView = [[TitleItemView alloc] initWithFrame:CGRectMake(INDICATOROFFSET+((SCREENWIDTH-2*INDICATOROFFSET)/_totoalPage)*i, 10, (SCREENWIDTH-2*INDICATOROFFSET)/_totoalPage, self.frame.size.height-10)];
        if (i==0) {
            _titleItemView = itemView;
        }
        __weak  CHBMenuSegment *weakSelf = self;
        itemView.menuBlock = ^(TitleItemView *tapView){
            [weakSelf.titleItemView.titleLabel setTextColor:[UIColor blackColor]];
            [tapView.titleLabel setTextColor:[UIColor colorWithHexString:THRMECOLOR]];
            weakSelf.titleItemView = tapView;
            if (_delegate&&[_delegate respondsToSelector:@selector(CHBMenuSegmentChangedIndicator:)]) {
                [_delegate CHBMenuSegmentChangedIndicator:tapView.tag-100];
            }
            [weakSelf setIndicatorPage:tapView.tag-100];
        };
        [itemView title:title];
        [itemView number:number];
        [itemView setTag:i+100];
        [_scrollView addSubview:itemView];
    }
    [_indicatorImageView setFrame:CGRectMake(INDICATOROFFSET+2,self.frame.size.height-2, (SCREENWIDTH-2*INDICATOROFFSET)/_totoalPage-4, 2.0)];
}
-(void)setIndicatorPage:(NSInteger)currentPage{
    if (_indicatorImageView) {
        __weak  CHBMenuSegment *weakSelf = self;
        CGRect rect = _indicatorImageView.frame;
        [_indicatorImageView setFrame:rect];
        rect.origin.x =INDICATOROFFSET+2+currentPage*(4+rect.size.width);
        [UIView animateWithDuration:0.5 animations:^{
            [_indicatorImageView setFrame:rect];
        } completion:^(BOOL finished) {
            if (finished) {
                [weakSelf.titleItemView.titleLabel setTextColor:[UIColor blackColor]];
                TitleItemView *itemView = [weakSelf.scrollView viewWithTag:100+currentPage];
                [itemView.titleLabel setTextColor:[UIColor colorWithHexString:THRMECOLOR]];
                weakSelf.titleItemView = itemView;
            }
        }];
    }
}
@end
