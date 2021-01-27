//
//  XSTimerTextView.m
//  FREEGOU
//
//  Created by xin sun on 2020/6/29.
//  Copyright © 2020 xin sun. All rights reserved.
//

#import "XSTimerTextView.h"


@interface XSTimerTextView ()

@property(nonatomic,strong)UILabel *ddLabel;

@property(nonatomic,strong)UILabel *hLabel;
@property(nonatomic,strong)UILabel *mLabel;
@property(nonatomic,strong)UILabel *sLabel;

@property(nonatomic,strong)UILabel *zoomlabel;

@property(nonatomic,strong)UILabel *oneLabel;
@property(nonatomic,strong)UILabel *twoLabel;


/**  定时器 */
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger currentTime;

//@property(nonatomic,assign)BOOL isLog;
///**  是否是进入了后台 */
//@property (assign, nonatomic) BOOL isEndterToBackgroud;
///**  进入后台的计时 */
//@property (assign, nonatomic) NSInteger endterToBackgroudTime;


@property(nonatomic,assign)NSInteger dNum;

@property(nonatomic,assign)NSInteger hNum;
@property(nonatomic,assign)NSInteger mNum;
@property(nonatomic,assign)NSInteger sNum;

@end

@implementation XSTimerTextView


-(void)dealloc{
    
    [self invTimer];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(UILabel *)ddLabel{
    if (!_ddLabel) {
        _ddLabel=[UILabel new];
    }
    return _ddLabel;
}


-(UILabel *)hLabel{
    if (!_hLabel) {
        _hLabel=[UILabel new];
    }
    return _hLabel;
}

-(UILabel *)mLabel{
    if (!_mLabel) {
        _mLabel=[UILabel new];
    }
    return _mLabel;
}

-(UILabel *)sLabel{
    if (!_sLabel) {
        _sLabel=[UILabel new];
    }
    return _sLabel;
}

-(UILabel *)zoomlabel{
    if (!_zoomlabel) {
        _zoomlabel=[UILabel new];
    }
    return _zoomlabel;
}

-(UILabel *)oneLabel{
    if (!_oneLabel) {
        _oneLabel=[UILabel new];
    }
    return _oneLabel;
}

-(UILabel *)twoLabel{
    if (!_twoLabel) {
        _twoLabel=[UILabel new];
    }
    return _twoLabel;
}



-(void)setCalculationTime:(NSInteger)calculationTime{
    _calculationTime=calculationTime;
    
    [self setUp];

    if (calculationTime<=0) {

    }else{
        
        [self addTimer];
    }
    
    self.currentTime=calculationTime;

    [self calculation];

}



-(instancetype)init{
    
    self=[super init];
    
    if (self) {
               
     
    }
    
    return self;
    
}


- (void)calculation
{
    //算出每个数
    
    NSInteger day = self.currentTime/(24*3600);
    NSInteger hour = self.currentTime/3600;
    NSInteger minute = (self.currentTime - hour * 3600)/60;
    NSInteger second = self.currentTime - hour * 3600 - minute * 60;
    
    if (self.showDayBool==YES) {
        self.ddLabel.text=[NSString stringWithFormat:@"0%ld",(long)day];
        
        hour=hour%24;
        
        if (hour<10) {
            self.hLabel.text=[NSString stringWithFormat:@"0%ld",(long)hour];

        }else{
            self.hLabel.text=[NSString stringWithFormat:@"%ld",(long)hour];

        }
        
        if (minute<10) {
            self.mLabel.text=[NSString stringWithFormat:@"0%ld",(long)minute];

        }else{
            self.mLabel.text=[NSString stringWithFormat:@"%ld",(long)minute];

        }
        
        if (second<10) {
            self.sLabel.text=[NSString stringWithFormat:@"0%ld",(long)second];

        }else{
            self.sLabel.text=[NSString stringWithFormat:@"%ld",(long)second];

        }
        
        if (self.nowTimeBlock) {
            self.nowTimeBlock([NSString stringWithFormat:@"%ld:%ld:%ld:%ld",(long)day,(long)hour,(long)minute,(long)second]);
        }
        
        
    }else{
        if (hour<10) {
            self.hLabel.text=[NSString stringWithFormat:@"0%ld",(long)hour];

        }else{
            self.hLabel.text=[NSString stringWithFormat:@"%ld",(long)hour];

        }
        
        if (minute<10) {
            self.mLabel.text=[NSString stringWithFormat:@"0%ld",(long)minute];

        }else{
            self.mLabel.text=[NSString stringWithFormat:@"%ld",(long)minute];

        }
        
        if (second<10) {
            self.sLabel.text=[NSString stringWithFormat:@"0%ld",(long)second];

        }else{
            self.sLabel.text=[NSString stringWithFormat:@"%ld",(long)second];

        }
        
        if (self.nowTimeBlock) {
            self.nowTimeBlock([NSString stringWithFormat:@"%ld:%ld:%ld",(long)hour,(long)minute,(long)second]);
        }
        
    }
    
    
    
    
    if (self.currentTime<=0) {
        [self invTimer];
        
//        if ([self.delegate respondsToSelector:@selector(countdownViewTimerInv:)]) {
//            [self.delegate countdownViewTimerInv:self];
//        }
    }
    
    
}

-(void)setNumberBackgroudColor:(UIColor *)numberBackgroudColor{
    _numberBackgroudColor=numberBackgroudColor;
    
    self.ddLabel.backgroundColor=self.hLabel.backgroundColor=self.mLabel.backgroundColor=self.sLabel.backgroundColor=self.numberBackgroudColor;

}

-(void)setLabelColor:(UIColor *)labelColor{
    _labelColor=labelColor;
    
    self.ddLabel.textColor=self.hLabel.textColor=self.mLabel.textColor=self.sLabel.textColor=self.labelColor;

}

-(void)setSepBackgroupColor:(UIColor *)sepBackgroupColor{
    _sepBackgroupColor=sepBackgroupColor;
    self.zoomlabel.backgroundColor=self.oneLabel.backgroundColor=self.twoLabel.backgroundColor=self.sepBackgroupColor;

}

-(void)setSepColor:(UIColor *)sepColor{
    _sepColor=sepColor;
    self.zoomlabel.textColor=self.oneLabel.textColor=self.twoLabel.textColor=self.sepColor;

}

-(void)setTextFont:(NSInteger)textFont{
    _textFont=textFont;
    
    self.ddLabel.font=self.hLabel.font=self.mLabel.font=self.sLabel.font=[UIFont systemFontOfSize:self.textFont weight:UIFontWeightRegular];

}

-(void)setSepFont:(NSInteger)sepFont{
    _sepFont=sepFont;
    self.oneLabel.font=self.twoLabel.font=[UIFont systemFontOfSize:self.sepFont weight:UIFontWeightSemibold];
    self.zoomlabel.font=[UIFont systemFontOfSize:self.sepFont];

}


-(void)setShowDayBool:(BOOL)showDayBool{
    _showDayBool=showDayBool;
    
    __weak typeof(self) weakSelf=self;
    

    if (self.showDayBool==YES) {
        [self addSubview:self.ddLabel];
        [self addSubview:self.zoomlabel];
        [self.ddLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(weakSelf.mas_leading);
            make.centerY.equalTo(weakSelf);
            make.height.width.mas_equalTo(weakSelf.mas_height);
        }];
        [self.zoomlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(weakSelf.ddLabel.mas_trailing);
            make.centerY.equalTo(weakSelf);
            make.height.width.mas_equalTo(weakSelf.mas_height);
        }];
        [self addSubview:self.hLabel];
        [self.hLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(weakSelf.zoomlabel.mas_trailing);
            make.centerY.equalTo(weakSelf);
            make.height.width.mas_equalTo(weakSelf.mas_height);
        }];
    }else{
        [self addSubview:self.hLabel];
        [self.hLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(weakSelf);
            make.centerY.equalTo(weakSelf);
            make.height.width.mas_equalTo(weakSelf.mas_height);
        }];
    }
    
    [self addSubview:self.oneLabel];
    [self addSubview:self.mLabel];
    
    [self addSubview:self.twoLabel];
    [self addSubview:self.sLabel];

    
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.hLabel.mas_trailing);
        make.width.mas_equalTo(10);
        make.top.bottom.equalTo(weakSelf);
    }];
    
    [self.mLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.oneLabel.mas_trailing);
        make.centerY.equalTo(weakSelf);
        make.height.width.mas_equalTo(weakSelf.mas_height);
    }];
    
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.mLabel.mas_trailing);
        make.width.mas_equalTo(10);
        make.top.bottom.equalTo(weakSelf);
    }];
    
    [self.sLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.twoLabel.mas_trailing);
        make.centerY.equalTo(weakSelf);
        make.height.width.mas_equalTo(weakSelf.mas_height);
        make.trailing.equalTo(weakSelf.mas_trailing);
    }];
    
       
       
}

-(void)setUp{
    
    
    
//    //添加监听进入后台和进入前台的监听
//       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didEndterBackgroud) name:UIApplicationDidEnterBackgroundNotification object:nil];
//       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didEndterForward) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    self.zoomlabel.text=@"天";
    self.oneLabel.text=self.twoLabel.text=@":";
    
    self.zoomlabel.textAlignment=self.oneLabel.textAlignment=self.twoLabel.textAlignment=NSTextAlignmentCenter;
    
    self.ddLabel.textAlignment=self.hLabel.textAlignment=self.mLabel.textAlignment=self.sLabel.textAlignment=NSTextAlignmentCenter;
    
    self.ddLabel.layer.cornerRadius=self.hLabel.layer.cornerRadius=self.mLabel.layer.cornerRadius=self.sLabel.layer.cornerRadius=3;
    self.ddLabel.layer.masksToBounds=self.hLabel.layer.masksToBounds=self.mLabel.layer.masksToBounds=self.sLabel.layer.masksToBounds=YES;
       
 
    
}


/**
 *  添加定时器
 */
- (void)addTimer
{
    if (self.timer) {
        [self.timer invalidate];
    }
    __weak XSTimerTextView *weakSelf = self;
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:weakSelf selector:@selector(timerClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:weakSelf.timer forMode:NSRunLoopCommonModes];
}



/**
 *  定时器数数
 */
- (void)timerClick
{
  
    self.currentTime -=1;
    [self calculation];
    
    
//    NSLog(@"%ld",self.currentTime);
    
    if (self.currentTime==0) {
        [self stopNow];
    }
}


-(void)stopNow{
    
    if (self.stopBlock) {
        self.stopBlock();
    }
}


/**
 *  销毁定时器
 */
- (void)invTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


//- (void)didEndterBackgroud
//{
//    if (self.isLog)
//    NSLog(@"进入后台");
//    self.isEndterToBackgroud = YES;
    //销毁定时器
//    [self invTimer];
    //记住当前时间戳
//    self.endterToBackgroudTime = [[NSDate date]timeIntervalSince1970];
//}
//
//- (void)didEndterForward
//{
//    if (self.isEndterToBackgroud) {
//        if (self.isLog)
////        NSLog(@"进入前台");
//        self.isEndterToBackgroud = NO;
//        //当前时间减去当时退到后台时间
//        NSInteger currentTime = [[NSDate date]timeIntervalSince1970];
//        NSInteger timeFix = currentTime - self.endterToBackgroudTime;
//        self.currentTime = self.currentTime - timeFix;
//        if (self.currentTime > 0) {
//            //倒计时还是可以继续的
//            [self calculation];
//            [self addTimer];
//        } else {
//            self.hourFirstLabel.text = @"0";
//            self.hourSecondLabel.text = @"0";
//            self.minuteFirstLabel.text = @"0";
//            self.minuteSecondLabel.text = @"0";
//            self.secondsFirstLabel.text = @"0";
//            self.secondsSecondLabel.text = @"0";
//            //倒计时结束了
//            if ([self.delegate respondsToSelector:@selector(countdownViewTimerInv:)]) {
//                [self.delegate countdownViewTimerInv:self];
//            }
//        }
//    }
//}
//
//- (void)logOpen:(BOOL)isOpen
//{
//    self.isLog = isOpen;
//}

#pragma mark--------------view的生命周期
- (void)removeFromSuperview
{
    [super removeFromSuperview];
//    NSLog(@"我被移除了");
    [self invTimer];
}








@end
