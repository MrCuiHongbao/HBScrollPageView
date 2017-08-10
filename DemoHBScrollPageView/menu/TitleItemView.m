//
//  TitleItemView.m
//  XiMo
//
//  Created by Founder on 15/12/23.
//  Copyright © 2015年 Founder. All rights reserved.
//

#import "TitleItemView.h"
#import "UIColor+HTMLColors.h"
@interface TitleItemView()
@property(nonatomic,strong)UILabel *numberLabel;
@end
@implementation TitleItemView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat pointX=0,pointY=0,pointWidth=frame.size.width,pointHeight=30;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, pointWidth, pointHeight)];
        [_titleLabel setText:@"书评"];
        [_titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [self addSubview:_titleLabel];
        
        pointX=0,pointY=pointHeight,pointWidth=frame.size.width,pointHeight=20;
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX,pointY, pointWidth, pointHeight)];
        [_numberLabel setText:@"--"];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [_numberLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_numberLabel setTextColor:[UIColor colorWithHexString:@"#c0c0c0"]];
        [self addSubview:_numberLabel];
        
        UITapGestureRecognizer *tapGesure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
        [self addGestureRecognizer:tapGesure];
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
-(void)setTag:(NSInteger)tag{
    [super setTag:tag];
    if (tag==100) {
        [_titleLabel setTextColor:[UIColor colorWithHexString:THRMECOLOR]];
    }else{
        [_titleLabel setTextColor:[UIColor blackColor]];
    }
}
-(void)title:(NSString *)title{
    [_titleLabel setText:title];
}
-(void)number:(NSString *)number{
    [_numberLabel setText:number];
}
-(void)dealloc{
    [_numberLabel removeFromSuperview];
    _numberLabel = nil;
    [_titleLabel removeFromSuperview];
    _titleLabel = nil;
}
-(void)tapHandle:(UITapGestureRecognizer *)tapGesture{
   TitleItemView *itemView = (TitleItemView *) tapGesture.view;
    if (self.menuBlock) {
        self.menuBlock(itemView);
    }
}
@end
