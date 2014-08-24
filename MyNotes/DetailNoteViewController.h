//
//  DetailNoteViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import <UIKit/UIKit.h>

@class DetailNoteViewController;
@class Note;

@protocol DetailNoteViewControllerProtocol <NSObject>

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishAddingNote:(Note *)note;

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishShowNote:(Note *)note;

@end

@interface DetailNoteViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) Note *itemToShow;

@property (nonatomic, weak) id <DetailNoteViewControllerProtocol> delegate;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *currentDate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)done:(UIBarButtonItem *)sender;

@end
