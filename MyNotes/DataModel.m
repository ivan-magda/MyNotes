//
//  DataModel.m
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import "DataModel.h"
#import "Note.h"

@implementation DataModel

- (void)registerDefaults {
    NSDictionary *dictionary = @{@"NoteIndex": @-1,
                                 @"FirstTime": @YES,
                                 @"TextViewBeginEditFirstTime": @YES};
    [[NSUserDefaults standardUserDefaults]registerDefaults:dictionary];
}

- (void)handleFirstTime {
    BOOL firstTime = [[NSUserDefaults standardUserDefaults]boolForKey:@"FirstTime"];
    if (firstTime) {
        Note *note = [[Note alloc]init];
        note.text = @"Type a note";
        
        [self.notes addObject:note];
        [self setIndexOfSelectedNote:0];
        
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"FirstTime"];
    }
}

- (instancetype)init {
    if (self = [super init]) {
        [self loadNotesFromFile];
        [self registerDefaults];
        [self handleFirstTime];
    }
    return self;
}

- (NSString *)documentsDirectory {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [array firstObject];
}

- (NSString *)dataFilePath {
    return [[self documentsDirectory]stringByAppendingPathComponent:@"Notes.plist"];
}

- (void)saveNotesToFile {
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:self.notes forKey:@"Notes"];
    [archiver finishEncoding];
    
    [data writeToFile:[self dataFilePath] atomically:NO];
}

- (void)loadNotesFromFile {
    NSString *dataFilePath = [self dataFilePath];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:dataFilePath]) {
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]
                                         initForReadingWithData:data];
        self.notes = [unarchiver decodeObjectForKey:@"Notes"];
        [unarchiver finishDecoding];
    } else {
        self.notes = [[NSMutableArray alloc]initWithCapacity:20];
    }
}

- (NSInteger)indexOfSelectedNote {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"NoteIndex"];
}

- (void)setIndexOfSelectedNote:(NSInteger)index {
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"NoteIndex"];
}

@end
