//
//  ViewController.m
//  DemoHBScrollPageView
//
//  Created by Founder on 16/2/2.
//  Copyright © 2016年 hongbao.cui. All rights reserved.
//

#import "ViewController.h"
#import "HBScrollPageView.h"
#import "CHBMenuSegment.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()<ScrollPageViewDelegate,CHBMenuSegmentDelegate>
@property(nonatomic,strong)HBScrollPageView *scrollPageView;
@property(nonatomic,strong)CHBMenuSegment *segmentView;
@end

@implementation ViewController
#pragma mark-CHBMenuSegment
-(CHBMenuSegment *)segmentView{
    if (!_segmentView) {
        _segmentView = [[CHBMenuSegment alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SLIDERMENUHEIGHT)];
        [_segmentView setDelegate:self];
        [self.view addSubview:_segmentView];
    }
    return _segmentView;
}
#pragma mark-CHBMenuSegmentDelegate
-(void)CHBMenuSegmentChangedIndicator:(NSInteger)aPage{
    if (self.scrollPageView) {
        [self.scrollPageView moveScrollowViewAthIndex:aPage];
    }
}
-(void)setViewTitleItems:(NSArray *)titleItems{
    [self.segmentView setTitleItem:titleItems];
}
#pragma mark-HBScrollPageView
-(HBScrollPageView *)scrollPageView{
    if (_scrollPageView == nil) {
        _scrollPageView = [[HBScrollPageView alloc] initWithFrame:CGRectMake(0,SLIDERMENUHEIGHT, self.view.frame.size.width, self.view.frame.size.height-SLIDERMENUHEIGHT)];
        _scrollPageView.delegate = self;
//        [_scrollPageView.hbScrollView setScrollEnabled:NO];//禁止滚动
        [self.view addSubview:_scrollPageView];
    }
    return _scrollPageView;
}
-(void)setViewControllers:(NSArray *)viewControllers{
    if (self.scrollPageView&&viewControllers.count>0) {
        [_scrollPageView setViewControllerItems:viewControllers];
    }
}
#pragma mark-ScrollPageViewDelegate
-(void)didScrollPageViewChangedPage:(NSInteger)aPage{
    [_segmentView setIndicatorPage:aPage];
}
-(void)setCurrentViewController:(NSInteger)pageIndex{
    [_scrollPageView moveScrollowViewAthIndex:pageIndex];
    [_segmentView setIndicatorPage:pageIndex];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    NSArray *array = [NSArray arrayWithObjects:firstVC,secondVC,thirdVC, nil];
    [self setViewTitleItems:@[@{@"title":@"视图1",@"number":@"1"},@{@"title":@"视图2",@"number":@"2"},@{@"title":@"视图3",@"number":@"22"}]];
    [self setViewControllers:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
