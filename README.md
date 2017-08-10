# HBScrollPageView
a custom scrollPageView will show
根据UIPageViewController实现视图的翻转，优点在于按需加载

1.实例化类

        HBScrollPageView *scrollPageView = [[HBScrollPageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-SLIDERMENUHEIGHT)];
        scrollPageView.delegate = self;
//      [scrollPageView.hbScrollView setScrollEnabled:NO];//禁止滚动
        [self.view addSubview:scrollPageView];
        
  2 .添加数据源
  
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    NSArray *array = [NSArray arrayWithObjects:firstVC,secondVC,thirdVC, nil];
    [scrollPageView setViewControllerItems:array];

