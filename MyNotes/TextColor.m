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
    if (self = [super init]) {
        _redColor = 0.;
        _greenColor = 0.;
        _blueColor = 0.;
        _alphaColor = 1.;
    }
    return self;
}

- (id)initWithColorsRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    if (self = [super init]) {
        _redColor = red;
        _greenColor = green;
        _blueColor = blue;
        _alphaColor = alpha;
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
