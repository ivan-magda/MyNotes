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
    NSInteger _fontSize;
    NSArray *_textFamily;
    NSString *_fontName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textFamily = [UIFont familyNames];
    
    self.textLabel.text = self.noteToShow.text;
    
    _fontSize = self.noteToShow.textSize;
    _fontName = self.noteToShow.textFamily;
    [self.picker selectRow:_fontSize - 1 inComponent:0 animated:NO];
    [self.picker selectRow:[_textFamily indexOfObject:_fontName] inComponent:1 animated:NO];
    
    _textColor = [[TextColor alloc]initWithColorsRed:self.noteToShow.textColor.redColor
                                               green:self.noteToShow.textColor.greenColor
                                               blue:self.noteToShow.textColor.blueColor
                                               alpha:self.noteToShow.textColor.alphaColor];
    
    [self updateTextColor];
    [self updateFontForText];
    [self updateValuesOfColorSliders];
}


- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.delegate customizeNoteViewControllerDidCancel:self];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self.delegate customizeNoteViewController:self didFinishSelectColor:_textColor textSize:_fontSize andFamily:_fontName];
}

- (void)updateTextColor {
    UIColor *color = [UIColor colorWithRed:_textColor.redColor
                                     green:_textColor.greenColor
                                     blue:_textColor.blueColor
                                     alpha:_textColor.alphaColor];
    self.textLabel.textColor = color;
}

- (void)updateFontForText {
    self.textLabel.font = [UIFont fontWithName:_fontName size:(CGFloat)_fontSize];
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

#pragma mark - PickerViewDataSource -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return kNumberOfTextSizes;
    } else {
        return [_textFamily count];
    }
}

#pragma mark - UIPickerViewDelegate -

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [NSString stringWithFormat:@"%ld", (long)(row + 1)];
    } else {
        return _textFamily[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _fontSize = row + 1;
        [self updateFontForText];
    } else {
        _fontName = _textFamily[row];
        [self updateFontForText];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 40.;
    } else {
        return 270.;
    }
}


@end
