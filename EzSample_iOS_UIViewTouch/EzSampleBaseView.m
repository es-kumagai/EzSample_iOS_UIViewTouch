//
//  EzSampleBaseView.m
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/14.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleBaseView.h"

@implementation EzSampleBaseView
{
	BOOL _highlighted;
	BOOL _backgroundViewsUserInteractionEnabled;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	
	if (self)
	{
		self.name = @"Base View";

		_backgroundViewForNormal = [[EzSampleView alloc] initWithFrame:self.bounds];
		_backgroundViewForNormal.name = @"Normal Background View";
		_backgroundViewForNormal.delegate = self.delegate;
		_backgroundViewForNormal.backgroundColor = [UIColor brownColor];
		_backgroundViewForNormal.autoresizingMask = 0;
		_backgroundViewForNormal.userInteractionEnabled = self.backgroundViewsUserInteractionEnabled;
		
		_backgroundViewForHighlighted = [[EzSampleView alloc] initWithFrame:self.bounds];
		_backgroundViewForHighlighted.name = @"Highlighted Background View";
		_backgroundViewForHighlighted.delegate = self.delegate;
		_backgroundViewForHighlighted.backgroundColor = [UIColor yellowColor];
		_backgroundViewForHighlighted.autoresizingMask = 0;
		_backgroundViewForHighlighted.userInteractionEnabled = self.backgroundViewsUserInteractionEnabled;
		
		[self setHighlighed:NO];
}
	
	return self;
}

- (void)setDelegate:(id<EzSampleViewDelegate>)delegate
{
	[super setDelegate:delegate];
	
	self.backgroundViewForNormal.delegate = delegate;
	self.backgroundViewForHighlighted.delegate = delegate;
}

- (BOOL)backgroundViewsUserInteractionEnabled
{
	return _backgroundViewsUserInteractionEnabled;
}

- (void)setBackgroundViewsUserInteractionEnabled:(BOOL)backgroundViewsUserInteractionEnabled
{
	_backgroundViewsUserInteractionEnabled = backgroundViewsUserInteractionEnabled;
	
	self.backgroundViewForNormal.userInteractionEnabled = backgroundViewsUserInteractionEnabled;
	self.backgroundViewForHighlighted.userInteractionEnabled = backgroundViewsUserInteractionEnabled;
}

- (void)setHighlighed:(BOOL)highlighed
{
	_highlighted = highlighed;
	
	if (highlighed)
	{
		[self.backgroundViewForNormal removeFromSuperview];
		[self insertSubview:self.backgroundViewForHighlighted atIndex:0];
	}
	else
	{
		[self insertSubview:self.backgroundViewForNormal atIndex:0];
		[self.backgroundViewForHighlighted removeFromSuperview];
	}
}

- (BOOL)highlighed
{
	return _highlighted;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];
	
	[self setHighlighed:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];
	
	[self setHighlighed:NO];
}

@end
