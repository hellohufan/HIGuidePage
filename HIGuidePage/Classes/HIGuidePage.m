//
//  HIGuidePage.m
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "HIGuidePage.h"
#import "HIGuidePageVC.h"

@interface HIGuidePage()
@property (nonatomic, strong) UIView *coreView;
@property (nonatomic, strong) HIGuidePageVC *guidVC;
@end

@implementation HIGuidePage

+ (instancetype) instance{
    static HIGuidePage *result = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        result = [[HIGuidePage alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        result.windowLevel = UIWindowLevelAlert;
    });
    return result;
}

- (void)showGuidePageWithImages:(nonnull NSArray *)images withCompletionBlock:(nullable HIGuildePageCompletionBlock)block{
    [self showGuidePageWithImages:images withButtonTitle:nil withCompletionBlock:block];
}

- (void)showGuidePageWithImages:(nonnull NSArray *)images withButtonTitle:(nullable NSString *)title withCompletionBlock:(nullable HIGuildePageCompletionBlock)block{
    [self showGuidePageWithImages:images withButtonTitle:title withButtonTitleColor:nil withButtonBGColor:nil withButtonBorderColor:nil withCompletionBlock:block];
}

- (void)showGuidePageWithImages:(nonnull NSArray *)images withButtonTitle:(nullable NSString *)title withButtonTitleColor:(nullable UIColor *)titleColor withButtonBGColor:(nullable UIColor *)bgColor withButtonBorderColor:(nullable UIColor *)borderColor withCompletionBlock:(nullable HIGuildePageCompletionBlock)block{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    //根据版本号来判断是否需要显示引导页，一般来说每更新一个版本引导页都会有相应的修改
    BOOL hasShowedGuidePage = [userDefaults boolForKey:HIGuidePage_UserDefault_Version(version)];
    if (!hasShowedGuidePage) {
        if(block){
            block();
        }
        return;
    }
    HIGuidePageVC *controller = [[HIGuidePageVC alloc] init];
    controller.images = images;
    controller.buttonTitle = title? title: @"立即体验";
    controller.titleColor = titleColor? titleColor: [UIColor whiteColor];
    controller.buttonBgColor = bgColor? bgColor: [UIColor clearColor];
    controller.buttonBorderColor = borderColor? borderColor: [UIColor whiteColor];
    
    if([HIGuidePage appearance].lastButtonBottmSpace != nil){
        controller.lastButtonBottmSpace = [HIGuidePage appearance].lastButtonBottmSpace.integerValue;
    }
    else{
        controller.lastButtonBottmSpace = KHIGuidePage_DefaultLastButtonBottomSpace;
    }
    
    if([HIGuidePage appearance].pageControlBottomSpace != nil){
        controller.pageControlBottomSpace = [HIGuidePage appearance].pageControlBottomSpace.integerValue;
    }
    else{
        controller.pageControlBottomSpace = kHIGuidePage_DefaultPageControlBottomSpace;
    }
    
    __weak HIGuidePage *weakSelf = self;
    controller.completion = ^(void){
        [weakSelf resignKeyWindow];
        weakSelf.hidden = YES;
        if(block){
            block();
        }
    };
    controller.scrollFinishedBlock = ^(int pageIndex) {
        if (self.scrollFinishBlock) {
            self.scrollFinishBlock(pageIndex);
        }
    };
    [self setRootViewController:controller];
    [self addSubview:controller.view];
    self.coreView = controller.view;
    self.guidVC = controller;
    [self setupContraints];
    [self makeKeyAndVisible];
    self.hidden = NO;
    [userDefaults setBool:YES forKey:HIGuidePage_UserDefault_Version(version)];
    [userDefaults synchronize];
}

- (void)setupContraints{
    NSDictionary *dict = NSDictionaryOfVariableBindings(_coreView);
    NSString *vfl = @"|-0-[_coreView]-0-|";
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
    vfl = @"V:|-0-[_coreView]-0-|";
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict]];
}

@end
