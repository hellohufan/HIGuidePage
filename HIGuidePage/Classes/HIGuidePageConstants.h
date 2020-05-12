//
//  HIGuidePageConstants.h
//  HIGuidePageDemo

//
//  Created by IVAN on 2016/11/11.
//  Copyright © 2016年 amberease. All rights reserved.
//

#ifndef HIGuidePageConstants_h
#define HIGuidePageConstants_h

#define kHIGuidePageScreenBounds [UIScreen mainScreen].bounds
#define kCellIdentifier_HIPageGuidePage @"HIGuidePageCollectionViewCell"

#define kHIGuidePage_DefaultPageControlBottomSpace  20
#define KHIGuidePage_DefaultLastButtonBottomSpace   60
#define HIGuidePage_UserDefault_Version(v) [NSString stringWithFormat:@"HIGuidePage_version_%@", v]

typedef void(^HIGuildePageCompletionBlock)(void);
typedef void(^HIGuildePageScrollFinishedBlock)(int pageIndex);

#ifndef dispatch_queue_async_safe
#define dispatch_queue_async_safe(queue, block)\
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(queue)) {\
        block();\
    } else {\
        dispatch_async(queue, block);\
    }
#endif

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block) dispatch_queue_async_safe(dispatch_get_main_queue(), block)
#endif

#endif
