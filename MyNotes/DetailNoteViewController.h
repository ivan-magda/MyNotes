//
//  DetailNoteViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import <UIKit/UIKit.h>
#import "ColorSelectViewController.h"
#import "FontSelectViewController.h"

@class DetailNoteViewController;
@class Note;

@protocol DetailNoteViewControllerProtocol <NSObject>

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishAddingNote:(Note *)note;

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishShowNote:(Note *)note;

@end

@interface DetailNoteViewController : UIViewController <UITextViewDelegate,
                                                        ColorSelectViewControllerProtocol,
                                                        FontSelectViewControllerProtocol>

@property (nonatomic, weak) Note *itemToShow;

@property (nonatomic, weak) id <DetailNoteViewControllerProtocol> delegate;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *currentDate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)done:(UIBarButtonItem *)sender;

@end
