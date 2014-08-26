//
//  CustomizeNoteViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import "CustomizeNoteViewController.h"
#import "TextColor.h"
#import "Note.h"


static const NSInteger kNumberOfTextSizes = 19;

@interface CustomizeNoteViewController ()

@end

@implementation CustomizeNoteViewController {
    TextColor *_textColor;
    NSInteger _textSize;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textLabel.text = self.noteToShow.text;
    
    _textSize = self.noteToShow.textSize;
    [self.picker selectRow:_textSize - 1 inComponent:0 animated:NO];
    
    _textColor = [[TextColor alloc]initWithColorsRed:self.noteToShow.textColor.redColor
                                               green:self.noteToShow.textColor.greenColor
                                               blue:self.noteToShow.textColor.blueColor
                                               alpha:self.noteToShow.textColor.alphaColor];
    
    [self updateTextColor];
    [self updateTextSize];
    [self updateValuesOfColorSliders];
}


- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.delegate customizeNoteViewControllerDidCancel:self];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self.delegate customizeNoteViewController:self didFinishSelectColor:_textColor andTextSize:_textSize];
}

- (void)updateTextColor {
    UIColor *color = [UIColor colorWithRed:_textColor.redColor
                                     green:_textColor.greenColor
                                     blue:_textColor.blueColor
                                     alpha:_textColor.alphaColor];
    self.textLabel.textColor = color;
}

- (void)updateValuesOfColorSliders {
    self.redColorSlider.value   = _textColor.redColor;
    self.greenColorSlider.value = _textColor.greenColor;
    self.blueColorSlider.value  = _textColor.blueColor;
    self.alphaColorSlider.value = _textColor.alphaColor;
}


#pragma mark - Sliders Value Changed Events -

- (IBAction)redSliderChangedValue:(UISlider *)sender {
    _textColor.redColor = sender.value;
    [self updateTextColor];
}

- (IBAction)greenSliderChangedValue:(UISlider *)sender {
    _textColor.greenColor = sender.value;
    [self updateTextColor];
}

- (IBAction)blueSliderChangedValue:(UISlider *)sender {
    _textColor.blueColor = sender.value;
    [self updateTextColor];
}

- (IBAction)alphaSliderChangedValue:(UISlider *)sender {
    _textColor.alphaColor = sender.value;
    [self updateTextColor];
}

- (void)updateTextSize {
    self.textLabel.font = [UIFont systemFontOfSize:(CGFloat)_textSize];
}

#pragma mark - PickerViewDataSource -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return kNumberOfTextSizes;
}

#pragma mark - UIPickerViewDelegate -

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld", (long)(row + 1)];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _textSize = row + 1;
    [self updateTextSize];
}


@end
