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
- (instancetype)initDefaultConfigure;
@end

IB_DESIGNABLE
@interface CircleView : UIView
@property (nonatomic, assign) IBInspectable NSInteger cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *backgroundColor;

@property (nonatomic, assign) IBInspectable CGFloat fraction;
@property (nonatomic, strong) CircleViewConfigure     *configure;
@end
