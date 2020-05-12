//
//  HIGuidePage.h
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HIGuidePageConstants.h"

#define kAEGuideView_DefaultPageControlBottomSpace  20
#define KAEGuideView_DefaultLastButtonBottomSpace   60


@interface HIGuidePage : UIWindow

@property (nonatomic,strong) NSNumber* pageControlBottomSpace UI_APPEARANCE_SELECTOR;
@property (nonatomic,strong) NSNumber* lastButtonBottmSpace UI_APPEARANCE_SELECTOR;

+(instancetype) instance;
/**
 *  引导页图片
 *
 *  @param images      引导页图片
 *  @param title       按钮文字
 *  @param titleColor  文字颜色
 *  @param bgColor     按钮背景颜色
 *  @param borderColor 按钮边框颜色
 */
- (void)showGuideViewWithImages:(NSArray *)images
                 andButtonTitle:(NSString *)title
            andButtonTitleColor:(UIColor *)titleColor
               andButtonBGColor:(UIColor *)bgColor
           andButtonBorderColor:(UIColor *)borderColor withCompletionBlock:(void(^)(void))block;

@end
