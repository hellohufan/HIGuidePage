//
//  HIGuidePageCollectionViewCell.m
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "HIGuidePageCollectionViewCell.h"
#import "HIGuidePage.h"
#import "HIGuidePageConstants.h"

@interface HIGuidePageCollectionViewCell()
@property (nonatomic,assign) BOOL constraintsUdpated;
@end

@implementation HIGuidePageCollectionViewCell
- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.constraintsUdpated = NO;
    self.layer.masksToBounds = YES;
    self.imageView = [[UIImageView alloc] init];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.clipsToBounds = YES;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.hidden = YES;
    [btn setTitle:@"开始体验" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn.layer setCornerRadius:5];
    [btn.layer setBorderColor:[UIColor grayColor].CGColor];
    [btn.layer setBorderWidth:1.0f];
    [btn setBackgroundColor:[UIColor whiteColor]];
    self.button = btn;
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.constraintsUdpated == NO){
        if (!CGRectIsEmpty(self.contentView.bounds)){
            [self setupConstraints];
            self.constraintsUdpated = YES;
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
    }
}

-(void)setupConstraints{
    NSDictionary *dict = nil;
    NSString *vfl = nil;
    
    UIView *contentView = self.contentView;
    dict = NSDictionaryOfVariableBindings(contentView);
    vfl = @"|-0-[contentView]-0-|";
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    vfl = @"V:|-0-[contentView]-0-|";
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    
    /**/
    //ImageView
    dict = NSDictionaryOfVariableBindings(_imageView);
    vfl = @"|-0-[_imageView]-0-|";
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    vfl = @"V:|-0-[_imageView]-0-|";
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
     //*/
    
    //Button
    //button宽度
    dict = NSDictionaryOfVariableBindings(_button);
    vfl = @"[_button(200)]";
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    
    //button水平居中
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    //button垂直位置
    NSInteger bottomSpace = self.lastButtonBottmSpace;
    vfl = @"V:[_button(44.0)]-bottomSpace-|";
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:@{@"bottomSpace":@(bottomSpace)} views:dict]];
}
@end
