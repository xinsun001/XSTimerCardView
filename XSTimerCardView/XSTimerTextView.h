//
//  XSTimerTextView.h
//  FREEGOU
//
//  Created by xin sun on 2020/6/29.
//  Copyright © 2020 xin sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@class XSTimerTextView;

@protocol XSTimerTextViewDelegate <NSObject>

/**
 *  倒数结束后调用的方法
 */
- (void)countdownViewTimerInv:(XSTimerTextView *)countdownView;

@end

@interface XSTimerTextView : UIView


@property (weak, nonatomic) id<XSTimerTextViewDelegate>delegate;


@property(nonatomic,assign)NSInteger calculationTime;

/**  数字的背景色 */
@property (strong, nonatomic) UIColor *numberBackgroudColor;
/**  :的背景色 */
@property (strong, nonatomic) UIColor *sepBackgroupColor;
/**  设置文字的颜色 */
@property (strong, nonatomic) UIColor *labelColor;
/**  间隔符号的颜色 */
@property (strong, nonatomic) UIColor *sepColor;

@property(nonatomic,assign)NSInteger textFont;
@property(nonatomic,assign)NSInteger sepFont;


//- (void)logOpen:(BOOL)isOpen;

@property(nonatomic,assign)BOOL showDayBool;

- (void)invTimer;

@property(nonatomic,copy)void(^nowTimeBlock)(NSString *nowtimeStr);


@property(nonatomic,copy)void(^stopBlock)(void);

@end

NS_ASSUME_NONNULL_END
