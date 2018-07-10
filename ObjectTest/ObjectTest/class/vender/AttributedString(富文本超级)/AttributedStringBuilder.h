//
//  JMBAttributedStringBuilder.h
//  MyAttributedStringDemo
//
//  Created by oybq on 15/6/18.
//  qq:156355113
//  e-mail:obq0387_cn@sina.com
//  Copyright (c) 2015年 youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AttributedStringBuilder;

/**属性字符串区域***/
@interface AttributedStringRange : NSObject


-(AttributedStringRange*)setFont:(UIFont*)font;              //字体
-(AttributedStringRange*)setTextColor:(UIColor*)color;       //文字颜色
-(AttributedStringRange*)setBackgroundColor:(UIColor*)color; //背景色
-(AttributedStringRange*)setParagraphStyle:(NSParagraphStyle*)paragraphStyle;  //段落样式
-(AttributedStringRange*)setLigature:(BOOL)ligature;  //连体字符，好像没有什么作用
-(AttributedStringRange*)setKern:(CGFloat)kern; //字间距
-(AttributedStringRange*)setLineSpacing:(CGFloat)lineSpacing;   //行间距
-(AttributedStringRange*)setStrikethroughStyle:(int)strikethroughStyle;  //删除线
-(AttributedStringRange*)setStrikethroughColor:(UIColor*)StrikethroughColor NS_AVAILABLE_IOS(7_0);  //删除线颜色
-(AttributedStringRange*)setUnderlineStyle:(NSUnderlineStyle)underlineStyle; //下划线
-(AttributedStringRange*)setUnderlineColor:(UIColor*)underlineColor NS_AVAILABLE_IOS(7_0);  //下划线颜色
-(AttributedStringRange*)setShadow:(NSShadow*)shadow;                          //阴影
-(AttributedStringRange*)setTextEffect:(NSString*)textEffect NS_AVAILABLE_IOS(7_0);
-(AttributedStringRange*)setAttachment:(NSTextAttachment*)attachment NS_AVAILABLE_IOS(7_0); //将区域中的特殊字符: NSAttachmentCharacter,替换为attachement中指定的图片,这个来实现图片混排。
-(AttributedStringRange*)setLink:(NSURL*)url NS_AVAILABLE_IOS(7_0);   //设置区域内的文字点击后打开的链接
-(AttributedStringRange*)setBaselineOffset:(CGFloat)baselineOffset NS_AVAILABLE_IOS(7_0);  //设置基线的偏移量，正值为往上，负值为往下，可以用于控制UILabel的居顶或者居低显示
-(AttributedStringRange*)setObliqueness:(CGFloat)obliqueness NS_AVAILABLE_IOS(7_0);   //设置倾斜度
-(AttributedStringRange*)setExpansion:(CGFloat)expansion NS_AVAILABLE_IOS(7_0);  //压缩文字，正值为伸，负值为缩

-(AttributedStringRange*)setStrokeColor:(UIColor*)strokeColor;  //中空文字的颜色
-(AttributedStringRange*)setStrokeWidth:(CGFloat)strokeWidth;   //中空的线宽度


//可以设置多个属性
-(AttributedStringRange*)setAttributes:(NSDictionary*)dict;

//得到构建器
-(AttributedStringBuilder*)builder;

@end


/*属性字符串构建器*/
@interface AttributedStringBuilder : NSObject

+(AttributedStringBuilder*)builderWith:(NSString*)string;


-(id)initWithString:(NSString*)string;

-(AttributedStringRange*)range:(NSRange)range;  //指定区域,如果没有属性串或者字符串为nil则返回nil,下面方法一样。
-(AttributedStringRange*)allRange;      //全部字符
-(AttributedStringRange*)lastRange;     //最后一个字符
-(AttributedStringRange*)lastNRange:(NSInteger)length;  //最后N个字符
-(AttributedStringRange*)firstRange;    //第一个字符
-(AttributedStringRange*)firstNRange:(NSInteger)length;  //前面N个字符
-(AttributedStringRange*)characterSet:(NSCharacterSet*)characterSet;             //用于选择特殊的字符
-(AttributedStringRange*)includeString:(NSString*)includeString all:(BOOL)all;   //用于选择特殊的字符串
-(AttributedStringRange*)regularExpression:(NSString*)regularExpression all:(BOOL)all;   //正则表达式


//段落处理,以\n结尾为一段，如果没有段落则返回nil
-(AttributedStringRange*)firstParagraph;
-(AttributedStringRange*)nextParagraph;


//插入，如果为0则是头部，如果为-1则是尾部
-(void)insert:(NSInteger)pos attrstring:(NSAttributedString*)attrstring;
-(void)insert:(NSInteger)pos attrBuilder:(AttributedStringBuilder*)attrBuilder;

-(NSAttributedString*)commit;


@end
