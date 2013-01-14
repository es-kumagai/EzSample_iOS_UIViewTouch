//
//  EzSampleView.h
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/13.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleViewDelegate.h"

@interface EzSampleView : UIView

@property (nonatomic,readwrite,copy) NSString* name;
@property (nonatomic,readwrite,weak) IBOutlet id<EzSampleViewDelegate> delegate;

@end
