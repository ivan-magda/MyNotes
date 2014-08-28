//
//  TextColor.m
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import "TextColor.h"

@implementation TextColor

- (instancetype)init {
    return [self initWithColorsRed:0.0 green:0.0 blue:0.0];
}

- (id)initWithColorsRed:(float)red green:(float)green blue:(float)blue {
    if (self = [super init]) {
        self.redColor = red;
        self.greenColor = green;
        self.blueColor = blue;
        self.alphaColor = 1.0;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.redColor = [aDecoder decodeFloatForKey:  @"Red Color"];
        self.greenColor = [aDecoder decodeFloatForKey:@"Green Color"];
        self.blueColor = [aDecoder decodeFloatForKey: @"Blue Color"];
        self.alphaColor = [aDecoder decodeFloatForKey:@"Alpha Color"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:self.redColor forKey:  @"Red Color"];
    [aCoder encodeFloat:self.greenColor forKey:@"Green Color"];
    [aCoder encodeFloat:self.blueColor forKey: @"Blue Color"];
    [aCoder encodeFloat:self.alphaColor forKey:@"Alpha Color"];
}

@end
