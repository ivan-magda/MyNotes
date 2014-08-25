//
//  Note.m
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import "Note.h"
#import "TextColor.h"

@implementation Note

- (instancetype)init {
    if (self =[super init]) {
        _text = @"test";
        _date = [NSDate date];
        _textColor = [[TextColor alloc]init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.date = [aDecoder decodeObjectForKey:@"Date"];
        self.textColor = [aDecoder decodeObjectForKey:@"Text Color"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeObject:self.date forKey:@"Date"];
    [aCoder encodeObject:self.textColor forKey:@"Text Color"];
}

@end
