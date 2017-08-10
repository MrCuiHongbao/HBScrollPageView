//
//  TitleItemView.h
//  XiMo
//
//  Created by Founder on 15/12/23.
//  Copyright © 2015年 Founder. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleItemView;
typedef void (^TapMenuBlock)(TitleItemView *itemView);
@interface TitleItemView : UIView
@property(nonatomic,setter=title:)NSString *title;
@property(nonatomic,setter=number:)NSString *number;
@property(nonatomic,copy)TapMenuBlock menuBlock;
@property(nonatomic,strong)UILabel *titleLabel;
@end
