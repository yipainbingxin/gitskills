//
//  MarqueeLabelController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/11.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "MarqueeLabelController.h"
#import "MarqueeLabel.h"

@interface MarqueeLabelController ()

@end

@implementation MarqueeLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    MarqueeLabel *durationLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20.0f, 20.0f) duration:8.0 andFadeLength:10.0f];
    durationLabel.tag = 101;
    durationLabel.numberOfLines = 1;
    durationLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    durationLabel.textAlignment = NSTextAlignmentLeft;
    durationLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    durationLabel.backgroundColor = [UIColor clearColor];
    durationLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    durationLabel.text = @"This is a test of the label. Look how long this label is! It's so long it stretches off the view!";
    [self.view addSubview:durationLabel];
    
    
    // Rate label example
    MarqueeLabel *rateLabelOne = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 20) rate:50.0f andFadeLength:10.0f];
    rateLabelOne.numberOfLines = 1;
    rateLabelOne.opaque = NO;
    rateLabelOne.enabled = YES;
    rateLabelOne.fadeLength = 10.f;
    rateLabelOne.shadowOffset = CGSizeMake(0.0, -1.0);
    rateLabelOne.textAlignment = NSTextAlignmentLeft;
    rateLabelOne.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    rateLabelOne.backgroundColor = [UIColor clearColor];
    rateLabelOne.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    rateLabelOne.text = @"This is another long label that scrolls at a specific rate, rather than scrolling its length in a specific time window!";
    
    // For Autoresizing test
    rateLabelOne.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:rateLabelOne];
    
    
    // Tap to scroll
    MarqueeLabel *tapToScrollLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 230, self.view.frame.size.width-20, 20) rate:50.0f andFadeLength:10.0f];
    tapToScrollLabel.numberOfLines = 1;
    tapToScrollLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    tapToScrollLabel.textAlignment = NSTextAlignmentLeft;
    tapToScrollLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    tapToScrollLabel.backgroundColor = [UIColor clearColor];
    tapToScrollLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    tapToScrollLabel.tapToScroll = YES;
    tapToScrollLabel.text = @"This label will not scroll until tapped, and then it performs its scroll cycle only once.";
    [self.view addSubview:tapToScrollLabel];
    
    
    // MLRightLeft label example
    MarqueeLabel *rightLeftLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 260, self.view.frame.size.width-20, 20) rate:50.0f andFadeLength:10.0f];
    rightLeftLabel.numberOfLines = 1;
    rightLeftLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    rightLeftLabel.textAlignment = NSTextAlignmentRight;
    rightLeftLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    rightLeftLabel.backgroundColor = [UIColor clearColor];
    rightLeftLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    rightLeftLabel.marqueeType = MLRightLeft;
    rightLeftLabel.text =@"This text is not as long, but still long enough to scroll, and scrolls the same speed but to the right first!";
    [self.view addSubview:rightLeftLabel];
    
    // Continuous label example
    MarqueeLabel *continuousLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-20, 20) rate:100.0f andFadeLength:10.0f];
    continuousLabel.tag = 102;
    continuousLabel.marqueeType = MLContinuous;
    continuousLabel.numberOfLines = 1;
    continuousLabel.opaque = NO;
    continuousLabel.enabled = YES;
    continuousLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    continuousLabel.textAlignment = NSTextAlignmentCenter;
    continuousLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    continuousLabel.backgroundColor = [UIColor clearColor];
    continuousLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    continuousLabel.text = @"This is a short, centered label.";
    [self.view addSubview:continuousLabel];
    
    // Second continuous label example
    MarqueeLabel *continuousLabel2 = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 330, self.view.frame.size.width-20, 20) rate:100.0f andFadeLength:10.0f];
    continuousLabel2.tag = 101;
    continuousLabel2.marqueeType = MLContinuous;
    continuousLabel2.animationCurve = UIViewAnimationOptionCurveLinear;
    continuousLabel2.continuousMarqueeExtraBuffer = 50.0f;
    continuousLabel2.numberOfLines = 1;
    continuousLabel2.opaque = NO;
    continuousLabel2.enabled = YES;
    continuousLabel2.shadowOffset = CGSizeMake(0.0, -1.0);
    continuousLabel2.textAlignment = NSTextAlignmentLeft;
    continuousLabel2.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    continuousLabel2.backgroundColor = [UIColor purpleColor];
    continuousLabel2.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.000];
    continuousLabel2.text = @"This is another long label that scrolls continuously with a custom space between labels! You can also tap it to pause and unpause it!";
    
    [self.view addSubview:continuousLabel2];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [continuousLabel2 addGestureRecognizer:tapRecognizer];
    continuousLabel2.userInteractionEnabled = YES; // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
}

- (void)changeTheLabel {
    // Generate even or odd
    int i = arc4random() % 2;
    if (i == 0) {
        [(MarqueeLabel *)[self.view viewWithTag:101] setText:@"This label is not as long."];
        [(MarqueeLabel *)[self.view viewWithTag:102] setText:@"That also scrolls continuously rather than scrolling back and forth!"];
    } else {
        [(MarqueeLabel *)[self.view viewWithTag:101] setText:@"Now we've switched to a string of text that is longer than the specified frame, and will scroll."];
        [(MarqueeLabel *)[self.view viewWithTag:102] setText:@"This is a short, centered label."];
    }
}

- (void)pauseTap:(UITapGestureRecognizer *)recognizer {
    MarqueeLabel *continuousLabel2 = (MarqueeLabel *)recognizer.view;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (!continuousLabel2.isPaused) {
            [continuousLabel2 pauseLabel];
        } else {
            [continuousLabel2 unpauseLabel];
        }
    }
}



// For Autoresizing test
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}






@end
