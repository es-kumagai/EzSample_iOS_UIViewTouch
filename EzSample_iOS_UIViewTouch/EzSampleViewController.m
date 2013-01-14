//
//  EzSampleViewController.m
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/13.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleViewController.h"

@interface EzSampleViewController ()

@end

@implementation EzSampleViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self baseViewUserInteractionEnabled:self.baseViewUserInteractionSwitch];
}

- (void)EzSampleView:(EzSampleView *)view touchesBegan:(NSSet *)touches withEvents:(UIEvent *)event
{
	[self countInclementByView:view began:YES];
}

- (void)EzSampleView:(EzSampleView *)view touchesEnded:(NSSet *)touches withEvents:(UIEvent *)event
{
	[self countInclementByView:view began:NO];
}

- (void)baseViewUserInteractionEnabled:(UISwitch *)sender
{
	self.baseView.backgroundViewsUserInteractionEnabled = sender.on;
}

- (void)countInclementByView:(EzSampleView *)view began:(BOOL)began;
{
	UILabel* targetLabel;

	NSString* viewName = view.name;
	
	if ([viewName isEqualToString:@"Base View"])
	{
		targetLabel = (began ? self.countLabelForBaseViewBegan : self.countLabelForBaseViewEnded);
	}
	else if ([viewName isEqualToString:@"Normal Background View"])
	{
		targetLabel = (began ? self.countLabelForNormalBackgroundViewBegan : self.countLabelForNormalBackgroundViewEnded);
	}
	else if ([viewName isEqualToString:@"Highlighed Background View"])
	{
		targetLabel = (began ? self.countLabelForHighlightedBackgroundViewBegan : self.countLabelForHighlightedBackgroundViewEnded);
	}
	else
	{
		targetLabel = nil;
	}
	
	targetLabel.text = [[NSString alloc] initWithFormat:@"%d", targetLabel.text.integerValue + 1];
}

@end
