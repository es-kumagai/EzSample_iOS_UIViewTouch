//
//  EzSampleView.m
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/13.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleView.h"

@implementation EzSampleView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];

	[self.delegate EzSampleView:self touchesBegan:touches withEvents:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];

	[self.delegate EzSampleView:self touchesEnded:touches withEvents:event];
}

@end
