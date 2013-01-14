//
//  EzSampleViewController.h
//  EzSample_iOS_UIViewTouch
//
//  Created by 熊谷 友宏 on H.25/01/13.
//  Copyright (c) 平成25年 Tomohiro Kumagai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EzSampleBaseView.h"

@interface EzSampleViewController : UIViewController <EzSampleViewDelegate>

@property (nonatomic,readonly,weak) IBOutlet EzSampleBaseView* baseView;
@property (nonatomic,readonly,weak) IBOutlet UISwitch* baseViewUserInteractionSwitch;

@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForBaseViewBegan;
@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForNormalBackgroundViewBegan;
@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForHighlightedBackgroundViewBegan;

@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForBaseViewEnded;
@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForNormalBackgroundViewEnded;
@property (nonatomic,readonly,weak) IBOutlet UILabel* countLabelForHighlightedBackgroundViewEnded;

- (void)countInclementByView:(EzSampleView*)view began:(BOOL)began;
- (IBAction)baseViewUserInteractionEnabled:(UISwitch*)sender;

@end
