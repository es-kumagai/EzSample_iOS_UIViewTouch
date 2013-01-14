//
//  EzSampleBaseView.h
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/14.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleView.h"

@interface EzSampleBaseView : EzSampleView

@property (nonatomic,readonly,strong) EzSampleView* backgroundViewForNormal;
@property (nonatomic,readonly,strong) EzSampleView* backgroundViewForHighlighted;

@property (nonatomic,readwrite) BOOL highlighed;
@property (nonatomic,readwrite) BOOL backgroundViewsUserInteractionEnabled;

@end
