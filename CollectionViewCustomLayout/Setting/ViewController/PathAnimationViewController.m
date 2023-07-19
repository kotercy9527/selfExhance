#import "PathAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PathAnimationViewController ()

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation PathAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置进度
    self.progress = 0.6; // 这里设置进度为60%
    // 创建进度圆环
    [self createProgressRing];
    // 更新进度
    [self updateProgress];
}

- (void)createProgressRing {
    // 圆环的中心点
    CGPoint center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2);
    // 圆环的半径
    CGFloat radius = 50.0;
    // 圆环的线宽
    CGFloat lineWidth = 10.0;
    
    // 创建圆环路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:M_PI * 2 clockwise:YES];
    
    // 创建背景圆环CAShapeLayer并设置路径、线宽、填充色和线条颜色
    self.backgroundLayer = [CAShapeLayer layer];
    self.backgroundLayer.path = circlePath.CGPath;
    self.backgroundLayer.lineWidth = lineWidth;
    self.backgroundLayer.fillColor = [UIColor clearColor].CGColor;
    self.backgroundLayer.strokeColor = [UIColor lightGrayColor].CGColor; // 设置圆环的背景颜色
    
    // 设置圆环两端为圆形
    self.backgroundLayer.lineCap = kCALineCapRound;
    
    // 将背景圆环CAShapeLayer添加到视图的图层中
    [self.view.layer addSublayer:self.backgroundLayer];
    
    // 创建进度圆环CAShapeLayer并设置路径、线宽、填充色和线条颜色
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = circlePath.CGPath;
    self.progressLayer.lineWidth = lineWidth;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor blueColor].CGColor; // 设置圆环的初始颜色
    
    // 设置圆环两端为圆形
    self.progressLayer.lineCap = kCALineCapRound;
    
    // 设置初始的strokeEnd属性，使圆环有颜色，但不显示进度
    self.progressLayer.strokeEnd = 0.0;
    
    // 将进度圆环CAShapeLayer添加到视图的图层中
    [self.view.layer addSublayer:self.progressLayer];
}

- (void)updateProgress {
    // 设置动画时间
    CGFloat animationDuration = 2.0;
    
    // 创建动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = animationDuration;
    animation.fromValue = @(0.0);
    animation.toValue = @(self.progress);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = NO;
    
    // 将动画添加到进度圆环的CAShapeLayer中
    [self.progressLayer addAnimation:animation forKey:@"progressAnimation"];
}

@end

