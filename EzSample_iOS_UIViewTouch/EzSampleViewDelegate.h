//
//  EzSampleViewDelegate.h
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/14.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EzSampleView;

@protocol EzSampleViewDelegate <NSObject>

@required

- (void)EzSampleView:(EzSampleView*)view touchesBegan:(NSSet*)touches withEvents:(UIEvent*)event;
- (void)EzSampleView:(EzSampleView*)view touchesEnded:(NSSet*)touches withEvents:(UIEvent*)event;

@end
