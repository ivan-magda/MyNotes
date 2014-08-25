//
//  DataModel.h
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *notes;

- (void)saveNotesToFile;

- (NSInteger)indexOfSelectedNote;

- (void)setIndexOfSelectedNote:(NSInteger)index;

@end
