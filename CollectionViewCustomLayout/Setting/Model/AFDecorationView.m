//
//  AFDecorationViewCollectionReusableView.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/22.
//

#import "AFDecorationView.h"

@implementation AFDecorationView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer]; gradientLayer.colors = @[(id)[[UIColor blackColor] CGColor],
        (id)[[UIColor clearColor] CGColor]]; gradientLayer.backgroundColor = [[UIColor clearColor]
        CGColor];
        gradientLayer.frame = self.bounds;
        self.layer.mask = gradientLayer;
    }
    return self;
}
@end
