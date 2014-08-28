//
//  TextColor.h
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import <Foundation/Foundation.h>

@interface TextColor : NSObject <NSCoding>

@property (nonatomic, assign) float redColor, greenColor,
                                    blueColor, alphaColor;

- (id)initWithColorsRed:(float)red green:(float)green blue:(float)blue;

@end
