//
//  CHBMenuSegment.h
//  XiMo
//
//  Created by Founder on 15/12/23.
//  Copyright © 2015年 Founder. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CHBMenuSegmentDelegate <NSObject>
@required
-(void)CHBMenuSegmentChangedIndicator:(NSInteger)aPage;
@end
@interface CHBMenuSegment : UIView
@property(nonatomic,setter=setTitleItem:)NSArray *titleItems;
@property(nonatomic,setter=setIndicatorPage:)NSInteger currentPage;
@property(nonatomic,readonly)NSInteger totoalPage;
@property(nonatomic,weak)id<CHBMenuSegmentDelegate>delegate;
@end
