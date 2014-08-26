//
//  CustomizeNoteViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import <UIKit/UIKit.h>

@class CustomizeNoteViewController;
@class TextColor;
@class Note;

@protocol CustomizeNoteViewControllerProtocol <NSObject>

- (void)customizeNoteViewControllerDidCancel:(CustomizeNoteViewController *)controller;

- (void)customizeNoteViewController:(CustomizeNoteViewController *)controller didFinishSelectColor:(TextColor *)color andTextSize:(NSInteger)textSize;

@end

@interface CustomizeNoteViewController : UIViewController <UIPickerViewDelegate,
                                                           UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (nonatomic, weak) Note *noteToShow;
@property (nonatomic, weak) id <CustomizeNoteViewControllerProtocol> delegate;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)done:(UIBarButtonItem *)sender;

- (IBAction)redSliderChangedValue:(UISlider *)sender;
- (IBAction)greenSliderChangedValue:(UISlider *)sender;
- (IBAction)blueSliderChangedValue:(UISlider *)sender;
- (IBAction)alphaSliderChangedValue:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaColorSlider;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;



@end
