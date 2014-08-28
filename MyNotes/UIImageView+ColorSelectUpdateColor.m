//
//  UIImageView+ColorSelectUpdateBackgroundColor.m
//  MyNotes
//
//  Created by Ivan Magda on 28.08.14.
//
//

#import "UIImageView+ColorSelectUpdateColor.h"
#import "TextColor.h"

@implementation UIImageView (ColorSelectUpdateBackgroundColor)

- (void)updateBackgroundColorWithTextColor:(TextColor *)textColor {
    self.backgroundColor = [UIColor colorWithRed:textColor.redColor
                                                green:textColor.greenColor
                                                 blue:textColor.blueColor
                                                alpha:textColor.alphaColor];
}

@end
