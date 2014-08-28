//
//  UIImageView+ColorSelectUpdateBackgroundColor.h
//  MyNotes
//
//  Created by Ivan Magda on 28.08.14.
//
//

#import <UIKit/UIKit.h>

@class TextColor;

@interface UIImageView (ColorSelectUpdateBackgroundColor)

- (void)updateBackgroundColorWithTextColor:(TextColor *)textColor;

@end
