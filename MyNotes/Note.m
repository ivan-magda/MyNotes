//
//  Note.m
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import "Note.h"

@implementation Note

- (instancetype)init {
    if (self =[super init]) {
        _text = @"test";
        _date = [NSDate date];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.date = [aDecoder decodeObjectForKey:@"Date"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeObject:self.date forKey:@"Date"];
}

@end
