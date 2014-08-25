//
//  ColorSelectorViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import <UIKit/UIKit.h>

@class ColorSelectorViewController;
@class TextColor;
@class Note;

@protocol ColorSelectorViewControllerProtocol <NSObject>

- (void)colorSelectorViewControllerDidCancel:(ColorSelectorViewController *)controller;

- (void)colorSelectorViewController:(ColorSelectorViewController *)controller didFinishSelectColor:(TextColor *)color;

@end

@interface ColorSelectorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (nonatomic, weak) Note *noteToShow;
@property (nonatomic, weak) id <ColorSelectorViewControllerProtocol> delegate;

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



@end
