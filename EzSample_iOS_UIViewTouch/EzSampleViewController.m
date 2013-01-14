//
//  EzSampleViewController.m
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/13.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleViewController.h"

@interface EzSampleViewController ()

// 実行順序が判るように、時間を遅らせてカウンタを描画します。
- (void)EzSetCountToLabel:(NSArray*)countAndTargetLabel;

@property (atomic,readwrite) BOOL EzWriting;

@end

@implementation EzSampleViewController
{
	BOOL _writing;
	NSLock* _writingLock;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	_writingLock = [[NSLock alloc] init];
	
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
	else if ([viewName isEqualToString:@"Highlighted Background View"])
	{
		targetLabel = (began ? self.countLabelForHighlightedBackgroundViewBegan : self.countLabelForHighlightedBackgroundViewEnded);
	}
	else
	{
		targetLabel = nil;
	}
	
	if (targetLabel)
	{
		NSNumber* value = [[NSNumber alloc] initWithInteger:targetLabel.text.integerValue + 1];

		// 書き込み順番が判るように遅らせて出力します。そのためにバックグラウンドにいったん制御を渡します。
		[self performSelectorInBackground:@selector(EzSetCountToLabel:) withObject:@[ value, targetLabel ]];
	}
}

- (void)setEzWriting:(BOOL)EzWriting
{
	[_writingLock lock];
	
	_writing = EzWriting;
	
	[_writingLock unlock];
}

- (BOOL)EzWriting
{
	[_writingLock lock];
	
	@try
	{
		return _writing;
	}
	@finally
	{
		[_writingLock unlock];
	}
}

- (void)EzSetCountToLabel:(NSArray *)countAndTargetLabel
{
	// 誰かが書き込み中の時は待ちます。
	while (self.EzWriting)
	{
		[NSThread sleepForTimeInterval:0.01];
	}

	// だれも書き込まない状態になったらカウンタを更新します。
	[_writingLock lock];
	
	@try
	{
		_writing = YES;

		NSNumber* count = countAndTargetLabel[0];
		UILabel* label = countAndTargetLabel[1];
			
		[label performSelectorOnMainThread:@selector(setText:) withObject:count.description waitUntilDone:NO];
			
		[NSThread sleepForTimeInterval:0.24];
	}
	@finally
	{
		_writing = NO;
		
		[_writingLock unlock];
	}
}

@end
