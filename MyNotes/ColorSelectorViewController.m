//
//  ColorSelectorViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import "ColorSelectorViewController.h"
#import "TextColor.h"
#import "Note.h"

@interface ColorSelectorViewController ()

@end

@implementation ColorSelectorViewController {
    TextColor *_textColor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textLabel.text = self.noteToShow.text;
    
    _textColor = [[TextColor alloc]initWithColorsRed:self.noteToShow.textColor.redColor
                                               green:self.noteToShow.textColor.greenColor
                                               blue:self.noteToShow.textColor.blueColor
                                               alpha:self.noteToShow.textColor.alphaColor];
    
    [self updateTextColor];
    [self updateValuesOfColorSliders];
}


- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.delegate colorSelectorViewControllerDidCancel:self];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self.delegate colorSelectorViewController:self didFinishSelectColor:_textColor];
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

@end
