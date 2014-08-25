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
        self.textView.text = self.itemToShow.text;
        self.doneButton.enabled = YES;
        
        [self configTextForCurrentDateLabel];
        [self configTextViewHeight:self.textView];
    } else {
        _date = [NSDate date];
        
        [self configTextForCurrentDateLabel];
        [self.textView becomeFirstResponder];
    }
}

- (void)configTextForCurrentDateLabel {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.currentDate.text = [dateFormatter stringFromDate:_date];
    self.currentDate.textColor = self.currentDate.tintColor;
}


- (IBAction)done:(UIBarButtonItem *)sender {
    if (self.itemToShow == nil) {
        Note *note = [[Note alloc]init];
        note.text = self.textView.text;
        note.date = _date;
        
        [self.delegate detailNoteViewController:self didFinishAddingNote:note];
    } else {
        self.itemToShow.text = self.textView.text;
        
        [self.delegate detailNoteViewController:self didFinishShowNote:self.itemToShow];
    }
}

#pragma mark - Text View delegate -

- (void)configTextViewHeight:(UITextView *)textView {
    static const NSInteger kCheckTextViewToAdjustHeight = 37;
    
    if ([textView.text length] > kCheckTextViewToAdjustHeight) {
        CGRect frame = self.textView.frame;
        frame.size.height = self.textView.contentSize.height;
        self.textView.frame = frame;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *string = [textView.text stringByReplacingCharactersInRange:range
                                                              withString:text];
    self.doneButton.enabled = ([string length] > 0);
    
    [self configTextViewHeight:textView];
    
    return YES;
}

@end
