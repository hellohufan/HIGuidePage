//
//  HIGuidePageVC.h
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HIGuidePageConstants.h"

@interface HIGuidePageVC : UIViewController
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) UIColor *buttonBgColor;
@property (nonatomic, strong) UIColor *buttonBorderColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, copy) HIGuildePageCompletionBlock completion;
@property (nonatomic, copy) HIGuildePageScrollFinishedBlock scrollFinishedBlock;
@property (nonatomic,weak) UIWindow *window;

@property (nonatomic,assign) NSInteger pageControlBottomSpace;
@property (nonatomic,assign) NSInteger lastButtonBottmSpace;
@end
