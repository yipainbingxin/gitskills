//
//  LSEditCommentView.m
//  LeBookNew
//
//  Created by bing on 2018/3/30.
//  Copyright © 2018年 埼玉. All rights reserved.
//

#import "LSEditCommentView.h"
#import "Masonry.h"
static NSInteger kMaxBookCommentWordCount = 100;

@implementation LSEditCommentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backGroudView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
        backGroudView.backgroundColor = [UIColor blackColor];
        backGroudView.alpha = 0.5;
        [self addSubview:backGroudView];
        
        UIView *contentView=[UIView new];
        contentView.backgroundColor=[UIColor whiteColor];
        [self addSubview:contentView];
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(self).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 220));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
        }];
        
        NSArray *arryTitle=@[@"取消",@"发送"];
        for (int i=0; i<arryTitle.count; i++) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:arryTitle[i] forState:UIControlStateNormal];
            btn.tag=i+1;
            [contentView addSubview:btn];
            [btn addTarget:self action:@selector(btnCancleAndCommit:) forControlEvents:UIControlEventTouchUpInside];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(contentView).with.offset(0);
                make.size.mas_equalTo(CGSizeMake(60, 40));
                make.left.mas_equalTo(self.mas_left).with.offset(10+i*(SCREEN_WIDTH-80));
            }];
            
            if (i==0) {
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }else{
                [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                UILabel *seperateLineLabel = [[UILabel alloc]initWithFrame:CGRectZero];
                seperateLineLabel.backgroundColor = [UIColor redColor];
                [contentView addSubview:seperateLineLabel];
                [seperateLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(contentView).offset(0);
                    make.height.mas_equalTo(@1);
                    make.top.equalTo(btn.mas_bottom);
                }];
                
                
                _textView = [FSTextView textView];
                _textView.placeholder = @"发表你此刻的想法";
                [_textView setMaxLength:kMaxBookCommentWordCount];
                [contentView addSubview:_textView];
                [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(contentView).offset(5);
                    make.right.equalTo(contentView).offset(-5);
                    make.top.mas_equalTo(seperateLineLabel.mas_bottom).with.offset(10);
                    make.bottom.mas_equalTo(contentView.mas_bottom);
                }];
                
                _wordLimitLabel = [[UILabel alloc]initWithFrame:CGRectZero];
                _wordLimitLabel.textColor = [UIColor redColor];
                _wordLimitLabel.textAlignment = NSTextAlignmentRight;
                _wordLimitLabel.font = [UIFont systemFontOfSize:12];
                _wordLimitLabel.text = [NSString stringWithFormat:@"0/%@", @(kMaxBookCommentWordCount)];
                [contentView addSubview:_wordLimitLabel];
                [_wordLimitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(contentView).offset(0);
                    make.right.equalTo(contentView).offset(-10);
                    make.height.mas_equalTo(@30);
                    make.bottom.equalTo(_textView.mas_bottom);
                }];
                __weak LSEditCommentView *weakself = self;
                [_textView addTextDidChangeHandler:^(FSTextView *textView) {
                    NSLog(@"");
                    weakself.wordLimitLabel.text = [NSString stringWithFormat:@"%@/%@", @(textView.text.length), @(kMaxBookCommentWordCount)];
                }];
                
            }
        }

    }
    return self;
}

-(void)btnCancleAndCommit:(UIButton*)btn{
    if (btn.tag==1) {
        [self dismissCommentView];
    }else{
        if ([self.delegate respondsToSelector:@selector(selectedCommit:)]) {
            [self.delegate selectedCommit:_textView.text];
        }
    }
}
-(void)showCommentView:(UIView*)backView{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];

    
}
-(void)dismissCommentView{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
