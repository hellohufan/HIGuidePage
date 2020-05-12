//
//  HIGuidePageVC.m
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "HIGuidePageVC.h"
#import "HIGuidePageCollectionViewCell.h"



@interface HIGuidePageVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
{
}
@property (nonatomic,assign) BOOL constraintsUpdated;

@property (nonatomic,strong) UIPageControl* pageControl;
@property (nonatomic,strong) UICollectionView* collectionView;

@end

@implementation HIGuidePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.pageControl];
    self.constraintsUpdated = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateViewConstraints{
    [super updateViewConstraints];
    if(self.constraintsUpdated == NO){
        [self setupCollectionViewConstraints];
        [self setupPageControlConstaints];
        self.constraintsUpdated = YES;
    }
}



#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HIGuidePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_HIPageGuidePage forIndexPath:indexPath];
    cell.lastButtonBottmSpace = self.lastButtonBottmSpace;
    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    UIImage *img = [self.images objectAtIndex:indexPath.row];
    cell.imageView.image = img;
    [cell.button setHidden:indexPath.row < self.images.count - 1];
    [cell.button addTarget:self action:@selector(nextButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button setBackgroundColor:self.buttonBgColor];
    [cell.button setTitle:self.buttonTitle forState:UIControlStateNormal];
    [cell.button setTitleColor:self.titleColor forState:UIControlStateNormal];
    cell.button.layer.borderColor = [self.buttonBorderColor CGColor];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = (scrollView.contentOffset.x / kHIGuidePageScreenBounds.size.width);
}

/**
 *  点击立即体验按钮响应事件
 *
 *  @param sender sender
 */
- (void)nextButtonHandler:(id)sender {
    if(self.completion){
        self.completion();
    }
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = kHIGuidePageScreenBounds.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[HIGuidePageCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_HIPageGuidePage];
    }
    return _collectionView;
}


- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
        _pageControl.numberOfPages = self.images.count;
    }
    return _pageControl;
}

-(void)setupCollectionViewConstraints{
    NSDictionary *dict = NSDictionaryOfVariableBindings(_collectionView);
    NSString *vfl = @"|-0-[_collectionView]-0-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    
    vfl = @"V:|-0-[_collectionView]-0-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
}

-(void)setupPageControlConstaints{
    NSDictionary *dict = NSDictionaryOfVariableBindings(_pageControl);
    NSString *vfl = @"|-0-[_pageControl]-0-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    
    NSInteger bottomSpace = self.pageControlBottomSpace;
    vfl = @"V:[_pageControl(44.0)]-bottomSpace-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:@{@"bottomSpace":@(bottomSpace)} views:dict]];

}
@end
