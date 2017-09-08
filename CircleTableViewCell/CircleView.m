//
//  CircleView.m
//  CircleTableViewCell
//
//  Created by tom on 08/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

#import "CircleView.h"

@implementation CircleViewConfigure

- (instancetype)initDefaultConfigure {
    if (self = [super init]) {
        self.circleStrokeColor          = [UIColor grayColor];
        self.circleLineWidth            = 40;
        self.circleLineCap              = K_LINECAP_Round;
        self.circleLineJoin             = K_LINEJOIN_Round;
    }
    return self;
}

@end

@implementation CircleView
{
    CAShapeLayer            *_circle;
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
    _circle = [CAShapeLayer new];
    if (nil == _configure) {
        _configure = [[CircleViewConfigure alloc] initDefaultConfigure];
    }
    _circle.lineWidth =  _configure.circleLineWidth;
    _circle.lineCap = [self LineCap:_configure.circleLineCap];
    _circle.lineJoin = [self LineJoin:_configure.circleLineJoin];
}

- (void)setFraction:(CGFloat)fraction {

}

- (void)setCornerRadius:(NSInteger)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
    [self layoutIfNeeded];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.backgroundColor = backgroundColor;
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
