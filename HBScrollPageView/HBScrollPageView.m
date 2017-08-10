//
//  HBScrollPageView.m
//  FZReaderCenter
//
//  Created by hongbao.cui on 15-5-4.
//  Copyright (c) 2015年 com.chb. All rights reserved.
//

#import "HBScrollPageView.h"

@implementation HBScrollPageView
- (void)dealloc {
    [self setPagerView:nil];
    [self setViewControllerItems:nil];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commInit];
        self.userInteractionEnabled = YES;
    }
    return self;
}
-(void)commInit{
    _pagerView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pagerView.dataSource = self;
    _pagerView.delegate = self;
    _pagerView.view.backgroundColor = [UIColor clearColor];
    [_pagerView.view setFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height)];
    [(UIViewController *)_delegate addChildViewController:_pagerView];
    [self addSubview:_pagerView.view];
    [_pagerView didMoveToParentViewController:(UIViewController *)_delegate];
    
    for (UIView *v in _pagerView.view.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            _hbScrollView = (UIScrollView *)v;
            _hbScrollView.delegate = self;
            [_hbScrollView setPagingEnabled:YES];
        }
    }
}

- (void)setViewControllerItems:(NSArray *)viewControllerItems {
    if (viewControllerItems!=nil) {
        _viewControllerItems = viewControllerItems;
        UIViewController *vcObject = [self.viewControllerItems objectAtIndex:0];
        NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObject:vcObject]];
        [_pagerView setViewControllers:viewsArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
}
#pragma mark - 其他辅助功能
-(void)moveScrollowViewAthIndex:(NSInteger)aIndex {
    UIViewController *vcObject = [self.viewControllerItems objectAtIndex:aIndex];
    NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObject:vcObject]];
    [_pagerView setViewControllers:viewsArray direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}
-(NSInteger)getCurrentPageIndex{
    return _mCurrentPage;
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
}
#pragma mark - PageView Datasource
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index=[self.viewControllerItems indexOfObject:viewController];
    _mCurrentPage = index;
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)]) {
        [_delegate didScrollPageViewChangedPage:_mCurrentPage];
    }
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self.viewControllerItems objectAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index=[self.viewControllerItems indexOfObject:viewController];
    _mCurrentPage = index;
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)]) {
        [_delegate didScrollPageViewChangedPage:_mCurrentPage];
    }
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.viewControllerItems count]) {
        return nil;
    }
    return [self.viewControllerItems objectAtIndex:index];
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (finished&&completed) {
        if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)]) {
            [_delegate didScrollPageViewChangedPage:_mCurrentPage];
        }
    }
}
//指示器
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    return [self.viewControllerItems count];
//}
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
//    return mCurrentPage;
//}
#pragma mark - PageView Delegate
-(void)pageViewScroll:(NSUInteger)index {
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)]) {
        [_delegate didScrollPageViewChangedPage:index];
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if ([_delegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [_delegate scrollViewWillBeginDragging:_mCurrentPage];
        mNeedUseDelegate = YES;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([_delegate respondsToSelector:@selector(didScrollPageViewChangedPage:)] && mNeedUseDelegate) {
        [_delegate didScrollPageViewChangedPage:_mCurrentPage];
    }
}

@end
