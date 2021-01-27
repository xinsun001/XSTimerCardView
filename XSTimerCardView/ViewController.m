//
//  ViewController.m
//  XSTimerCardView
//
//  Created by admin on 2021/1/27.
//

#import "ViewController.h"
#import "XSTimerTextView.h"

@interface ViewController ()

@property(nonatomic,strong)XSTimerTextView *toptimerView;

@end

@implementation ViewController

-(XSTimerTextView *)toptimerView{
    if (!_toptimerView) {
        _toptimerView=[XSTimerTextView new];
        _toptimerView.calculationTime=3600*48+20;
        _toptimerView.showDayBool=YES;
        _toptimerView.numberBackgroudColor=[UIColor greenColor];
        _toptimerView.sepBackgroupColor=[UIColor blueColor];
        _toptimerView.labelColor=[UIColor blackColor];
        _toptimerView.sepColor=[UIColor whiteColor];
        _toptimerView.textFont=17;
        _toptimerView.sepFont=15;
    }
    return _toptimerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.toptimerView.frame=CGRectMake(60, 100, 30*5+20, 30);
    [self.view addSubview:self.toptimerView];

    
    XSTimerTextView *botmtimerView=[XSTimerTextView new];
    botmtimerView.calculationTime=3600*48;
    botmtimerView.showDayBool=NO;
    botmtimerView.numberBackgroudColor=[UIColor greenColor];
    botmtimerView.sepBackgroupColor=[UIColor blueColor];
    botmtimerView.labelColor=[UIColor blackColor];
    botmtimerView.sepColor=[UIColor whiteColor];
    botmtimerView.textFont=17;
    botmtimerView.sepFont=15;
    botmtimerView.frame=CGRectMake(60, 100+200, 30*3+20, 30);
    [self.view addSubview:botmtimerView];



}


@end
