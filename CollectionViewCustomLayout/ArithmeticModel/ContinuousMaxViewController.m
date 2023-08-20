//
//  ContinuousMaxViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/8/15.
//

#import "ContinuousMaxViewController.h"

@interface ContinuousMaxViewController ()

@property (nonatomic, strong) NSArray *rawArray;

@end

@implementation ContinuousMaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.rawArray = @[@(2),@(3),@(4),@(-1),@(10),@(-19),@(20)];
    CGFloat value = [self maxValue:self.rawArray windowSize:4];
    NSLog(@"%f",value);
//    nums = [-2,1,-3,4,-1,2,1,-5,4]
    self.rawArray = @[@(-2),@(1),@(-3),@(4),@(-1),@(2),@(1),@(-5),@(4)];
    CGFloat maxValue = [self contiunsMaxValue];
}

- (CGFloat)contiunsMaxValue {
    NSInteger maxValue = NSIntegerMin;
    for (NSInteger i = 0; i < self.rawArray.count; i++) {
        NSNumber * first = [self.rawArray  objectAtIndex:i];
        NSInteger tmpValue = first.integerValue;
        for (NSInteger j = i + 1; j < self.rawArray.count; j++) {
            NSNumber *second = [self.rawArray objectAtIndex:j];
            tmpValue += second.integerValue;
            if (tmpValue > maxValue) {
                maxValue = tmpValue;
            }
        }
    }
    return maxValue;
}


//数组连续最大值 window size是窗口大小
- (CGFloat )maxValue:(NSArray <NSNumber*> *)arr windowSize:(NSInteger)size {
    if (size < 1) {
        return 0;
    }
    NSInteger returnValue = 0;
    if (arr.count < size) {
        
        for (NSInteger i = 0 ; i < arr.count ; i++) {
            returnValue += [[arr objectAtIndex:i] integerValue];
        }
        return returnValue;
    }
    
    
    for (NSInteger i = size - 1; i < arr.count; i++) {
        NSInteger plusValue = 0;
        NSString *indexStr = @"";
        for (NSInteger j = 0; j< size; j++) {
            NSInteger index = i - j;
            indexStr = [indexStr stringByAppendingString:[NSString stringWithFormat:@"-%ld",index]];
            NSInteger currentValue = [arr objectAtIndex:index].integerValue;
            plusValue += currentValue;
        }
        NSLog(@"%@:%ld",indexStr,plusValue);
        if (plusValue > returnValue) {
            returnValue = plusValue;
        }
    }
    return returnValue;
    
}

@end
