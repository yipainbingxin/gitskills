//
//  LSEditCommentView.h
//  LeBookNew
//
//  Created by bing on 2018/3/30.
//  Copyright © 2018年 埼玉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSTextView.h>

@protocol LSEditCommentViewDelegate<NSObject>
-(void)selectedCommit:(NSString *)commitText;
@end

@interface LSEditCommentView : UIView
@property (nonatomic, strong) FSTextView *textView;
@property (nonatomic, strong) UILabel *wordLimitLabel;
@property(nonatomic,assign)id<LSEditCommentViewDelegate> delegate;
-(void)showCommentView:(UIView*)backView;
-(void)dismissCommentView;
@end
