//
//  CircleView.h
//  CircleTableViewCell
//
//  Created by tom on 08/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LINECAP) {
    K_LINECAP_Butt,
    K_LINECAP_Round,
    K_LINECAP_Square,
};

typedef NS_ENUM(NSInteger, LINEJOIN) {
    K_LINEJOIN_Miter,
    K_LINEJOIN_Round,
    K_LINEJOIN_Bevel,
};

@interface CircleViewConfigure : NSObject
@property (nonatomic, strong) UIColor       *circleStrokeColor;
@property (nonatomic, assign) CGFloat       circleLineWidth;
@property (nonatomic, assign) LINECAP       circleLineCap;
@property (nonatomic, assign) LINEJOIN      circleLineJoin;
+ (instancetype)defaultConfigure;
- (instancetype)initDefaultConfigureWithcircleStrokeColor:(UIColor*)strokeColor
                                          circleLineWidth:(CGFloat)lineWithd
                                            circleLineCap:(LINECAP)lineCap
                                           circleLineJoin:(LINEJOIN)lineJoin NS_DESIGNATED_INITIALIZER;
@end

IB_DESIGNABLE
@interface CircleView : UIView
@property (nonatomic, assign) IBInspectable NSInteger cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *backgroundColor_;

@property (nonatomic, assign) CGFloat fraction;   //0~1
@property (nonatomic, strong) CircleViewConfigure     *configure;
@end
