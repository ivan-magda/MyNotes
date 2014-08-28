//
//  ColorSelectViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import "ColorSelectViewController.h"
#import "UIImageView+ColorSelectUpdateColor.h"
#import "TextColor.h"
//#import "Note.h"


//static const NSInteger kNumberOfTextSizes = 24;

@interface ColorSelectViewController ()

@end

@implementation ColorSelectViewController {
    TextColor *_textColor;
  //  NSInteger _fontSize;
  //  NSArray *_textFamily;
  //  NSString *_fontName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textColor = [[TextColor alloc]initWithColorsRed:self.textColorToShow.redColor
                                               green:self.textColorToShow.greenColor
                                                blue:self.textColorToShow.blueColor];
    
  //  _textFamily = [UIFont familyNames];
  //  self.textLabel.text = self.noteToShow.text;
    
//    _fontSize = self.noteToShow.textSize;
//    _fontName = self.noteToShow.textFamily;
//    [self.picker selectRow:_fontSize - 1 inComponent:0 animated:NO];
//    [self.picker selectRow:[_textFamily indexOfObject:_fontName] inComponent:1 animated:NO];
    
    [self.colorToShow updateBackgroundColorWithTextColor:_textColor];
    [self updateValuesOfColorSliders];
    
    //[self updateFontForText];
}


- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.delegate colorSelectViewControllerDidCancel:self];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    self.textColorToShow.redColor = _textColor.redColor;
    self.textColorToShow.greenColor = _textColor.greenColor;
    self.textColorToShow.blueColor = _textColor.blueColor;
    
    [self.delegate colorSelectViewController:self didFinishSelectColor:self.textColorToShow];
}

//- (void)updateFontForText {
//    self.textLabel.font = [UIFont fontWithName:_fontName size:(CGFloat)_fontSize];
//}

- (void)updateValuesOfColorSliders {
    self.redColorSlider.value   = _textColor.redColor;
    self.greenColorSlider.value = _textColor.greenColor;
    self.blueColorSlider.value  = _textColor.blueColor;
}


#pragma mark - Sliders Value Changed Events -

- (IBAction)redSliderChangedValue:(UISlider *)sender {
    _textColor.redColor = sender.value;
    [self.colorToShow updateBackgroundColorWithTextColor:_textColor];
}

- (IBAction)greenSliderChangedValue:(UISlider *)sender {
    _textColor.greenColor = sender.value;
    [self.colorToShow updateBackgroundColorWithTextColor:_textColor];
}

- (IBAction)blueSliderChangedValue:(UISlider *)sender {
    _textColor.blueColor = sender.value;
    [self.colorToShow updateBackgroundColorWithTextColor:_textColor];
}

//#pragma mark - PickerViewDataSource -
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 2;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    if (component == 0) {
//        return kNumberOfTextSizes;
//    } else {
//        return [_textFamily count];
//    }
//}
//
//#pragma mark - UIPickerViewDelegate -
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if (component == 0) {
//        return [NSString stringWithFormat:@"%ld", (long)(row + 1)];
//    } else {
//        return _textFamily[row];
//    }
//}
//
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    if (component == 0) {
//        _fontSize = row + 1;
//        [self updateFontForText];
//    } else {
//        _fontName = _textFamily[row];
//        [self updateFontForText];
//    }
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    if (component == 0) {
//        return 40.;
//    } else {
//        return 270.;
//    }
//}


@end
