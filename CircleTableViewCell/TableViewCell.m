//
//  TableViewCell.m
//  CircleTableViewCell
//
//  Created by tom on 08/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

#import "TableViewCell.h"
#import "CircleView.h"
@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet CircleView *circleView;
@property (weak, nonatomic) IBOutlet UILabel *fractionLabel;

@end

@implementation TableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setFraction:(CGFloat)fraction {
    self.circleView.fraction = fraction;
    self.fractionLabel.text = [NSString stringWithFormat:@"%0.2f %%", fraction * 10.0];
}

@end
