//
//  Note.h
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import <Foundation/Foundation.h>

@class TextColor;

@interface Note : NSObject <NSCoding>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) TextColor *textColor;

@end
