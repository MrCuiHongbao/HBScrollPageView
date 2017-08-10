//
//  HBScrollPageView.h
//  FZReaderCenter
//
//  Created by hongbao.cui on 15-5-4.
//  Copyright (c) 2015年 com.chb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollPageViewDelegate <NSObject>
@required
-(void)didScrollPageViewChangedPage:(NSInteger)aPage;
@optional
-(void)scrollViewWillBeginDragging:(NSInteger)aPage;
@end

@interface HBScrollPageView : UIView<UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate> {
    BOOL mNeedUseDelegate;
}

@property (nonatomic,strong) UIPageViewController *pagerView;

@property (nonatomic,strong) NSArray *viewControllerItems;
@property (nonatomic,strong) UIScrollView *hbScrollView;
@property (nonatomic,weak) id<ScrollPageViewDelegate> delegate;

@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, readonly)NSInteger mCurrentPage;
#pragma mark 移动ScrollView到某个页面
-(void)moveScrollowViewAthIndex:(NSInteger)aIndex;
-(NSInteger)getCurrentPageIndex;

@end
