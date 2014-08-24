//
//  DetailNoteViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import "DetailNoteViewController.h"
#import "Note.h"

@interface DetailNoteViewController ()

@end

@implementation DetailNoteViewController {
    NSDate *_date;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.itemToShow) {
        _date = self.itemToShow.date;
        self.textField.text = self.itemToShow.text;
        self.doneButton.enabled = YES;
        
        [self configTextForCurrentDateLabel];
    } else {
        _date = [NSDate date];
        
        [self configTextForCurrentDateLabel];
        
        [self.textField becomeFirstResponder];
    }
}

- (void)configTextForCurrentDateLabel {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.currentDate.text = [dateFormatter stringFromDate:_date];
}


- (IBAction)done:(UIBarButtonItem *)sender {
    if (self.itemToShow == nil) {
        Note *note = [[Note alloc]init];
        note.text = self.textField.text;
        note.date = _date;
        
        [self.delegate detailNoteViewController:self didFinishAddingNote:note];
    } else {
        self.itemToShow.text = self.textField.text;
        
        [self.delegate detailNoteViewController:self didFinishShowNote:self.itemToShow];
    }
}

#pragma mark - Text field delegate -

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneButton.enabled = ([newString length] > 0);
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.textField becomeFirstResponder];
}

@end
