//
//  HIGuidePage.h
//  HIGuidePageDemo
//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HIGuidePageConstants.h"

@interface HIGuidePage : UIWindow

@property (nonatomic, strong, nullable) NSNumber *pageControlBottomSpace UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong, nullable) NSNumber *lastButtonBottmSpace UI_APPEARANCE_SELECTOR;

/**
*  引导页切换回调
*
*  @Discussion     page切换回调block
*/
@property (nonatomic, copy, nullable) HIGuildePageScrollFinishedBlock scrollFinishBlock;

+ (nonnull instancetype) instance;

/**
 *  引导页图片
 *
 *  @param images       引导页图片
 *  @Discussion     默认按钮文字和按钮边框白色，背景clear
 */
- (void)showGuidePageWithImages:(nonnull NSArray *)images
            withCompletionBlock:(nullable HIGuildePageCompletionBlock)block;

/**
 *  引导页图片
 *
 *  @param images       引导页图片
 *  @param title         按钮文字
 *  @Discussion     默认按钮文字和按钮边框白色，背景clear
 */
- (void)showGuidePageWithImages:(nonnull NSArray *)images
                 withButtonTitle:(nullable NSString *)title
            withCompletionBlock:(nullable HIGuildePageCompletionBlock)block;

/**
 *  引导页图片
 *
 *  @param images             引导页图片
 *  @param title               按钮文字
 *  @param titleColor    文字颜色
 *  @param bgColor           按钮背景颜色
 *  @param borderColor  按钮边框颜色
 */
- (void)showGuidePageWithImages:(nonnull NSArray *)images
                 withButtonTitle:(nullable NSString *)title
            withButtonTitleColor:(nullable UIColor *)titleColor
               withButtonBGColor:(nullable UIColor *)bgColor
           withButtonBorderColor:(nullable UIColor *)borderColor
            withCompletionBlock:(nullable HIGuildePageCompletionBlock)block;

@end
