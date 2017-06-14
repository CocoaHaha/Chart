//
//  PieChartViewController.m
//  图表Chart
//
//  Created by SXF on 2017/5/5.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "PieChartViewController.h"

@interface PieChartViewController ()<PNChartDelegate>

@property (nonatomic, strong)PNPieChart *pieChart; //饼状图

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"饼状图";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    [self initWithPieChart];//绘制饼状图
}
//饼状图
- (void)initWithPieChart{
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:15 color:PNDeepGreen description:@"GOOG I/O"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNLightGreen description:@"Google"],
                       [PNPieChartDataItem dataItemWithValue:15 color:PNLightBlue description:@"Baibu"],
                       [PNPieChartDataItem dataItemWithValue:10 color:PNLightYellow description:@"AliPay"]];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
}
#pragma - PNChartDelegate代理方法

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    
    
    NSLog(@"point  = %@ lineIndex = %ld",NSStringFromCGPoint(point),lineIndex);
    
}
- (void)userClickedOnLineKeyPoint:(CGPoint)point
                        lineIndex:(NSInteger)lineIndex
                       pointIndex:(NSInteger)pointIndex{
    
    NSLog(@"Keypoint  = %@ lineIndex = %ld pointIndex = %ld",NSStringFromCGPoint(point),lineIndex,pointIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
