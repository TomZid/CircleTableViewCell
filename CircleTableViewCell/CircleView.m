//
//  CircleView.m
//  CircleTableViewCell
//
//  Created by tom on 08/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

#import "CircleView.h"

@implementation CircleViewConfigure
- (instancetype)init {
    return [self initDefaultConfigureWithcircleStrokeColor:[UIColor redColor]
                                    circleLineWidth:5
                                      circleLineCap:K_LINECAP_Round
                                     circleLineJoin:K_LINEJOIN_Round];
}

- (instancetype)initDefaultConfigureWithcircleStrokeColor:(UIColor*)strokeColor
                                          circleLineWidth:(CGFloat)lineWithd
                                            circleLineCap:(LINECAP)lineCap
                                           circleLineJoin:(LINEJOIN)lineJoin {
    self = [super init];
    if (nil == self) {
        return nil;
    }
    self.circleStrokeColor  = strokeColor;
    self.circleLineWidth    = lineWithd;
    self.circleLineCap      = lineCap;
    self.circleLineJoin     = lineJoin;
    return self;
}

+ (instancetype)defaultConfigure {
    CircleViewConfigure *configure = [[self alloc] initDefaultConfigureWithcircleStrokeColor:[UIColor redColor]
                                                                             circleLineWidth:5
                                                                               circleLineCap:K_LINECAP_Round
                                                                              circleLineJoin:K_LINEJOIN_Round];
    return configure;
}

@end

@implementation CircleView
{
    CAShapeLayer            *_circle;
}
- (void)setConfigure:(CircleViewConfigure *)configure {
    NSParameterAssert(configure);
    _configure = configure;
    [self circle];
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self circle];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self circle];
    }
    return self;
}

- (void)circle {
    if (nil == _configure) {
        _configure          = [CircleViewConfigure defaultConfigure];
        _circle = ({
            CAShapeLayer *layer = [CAShapeLayer layer];
            CGFloat radius      = (CGRectGetWidth(self.bounds) - _configure.circleLineWidth) / 2;
            CGRect rect         = CGRectMake(_configure.circleLineWidth / 2, _configure.circleLineWidth / 2, radius * 2, radius * 2);
            layer.path = [UIBezierPath bezierPathWithOvalInRect:rect].CGPath;
            layer.strokeEnd   = 0.5;
            layer.fillColor   = nil;
            layer;
        });
        [self.layer addSublayer:_circle];
    }
    _circle.strokeColor     = _configure.circleStrokeColor.CGColor;
    _circle.lineWidth       = _configure.circleLineWidth;
    _circle.lineCap         = [self LineCap:_configure.circleLineCap];
    _circle.lineJoin        = [self LineJoin:_configure.circleLineJoin];
}

- (void)setFraction:(CGFloat)fraction {
    _circle.strokeEnd       = fraction;
    
}

- (void)setCornerRadius:(NSInteger)cornerRadius {
    self.layer.cornerRadius     = cornerRadius;
    self.layer.masksToBounds    = cornerRadius > 0;
    [self layoutIfNeeded];
}

- (void)setBackgroundColor_:(UIColor *)backgroundColor_ {
    self.backgroundColor = backgroundColor_;
}

- (NSString*)LineCap:(LINECAP)lineCap {
    switch (lineCap) {
        case K_LINECAP_Butt:
            return kCALineCapButt;
            break;
        case K_LINECAP_Round:
            return kCALineCapRound;
            break;
        case K_LINECAP_Square:
            return kCALineCapSquare;
            break;

        default:
            break;
    }
}

- (NSString*)LineJoin:(LINEJOIN)lineJoin {
    switch (lineJoin) {
        case K_LINEJOIN_Miter:
            return kCALineJoinMiter;
            break;
        case K_LINEJOIN_Round:
            return kCALineJoinRound;
            break;
        case K_LINEJOIN_Bevel:
            return kCALineJoinBevel;
            break;

        default:
            break;
    }
}

@end
