//
//  ColorSelectViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 25.08.14.
//
//

#import <UIKit/UIKit.h>

@class ColorSelectViewController;
@class ColorSelectView;
@class TextColor;

@protocol ColorSelectViewControllerProtocol <NSObject>

- (void)colorSelectViewControllerDidCancel:(ColorSelectViewController *)controller;

- (void)colorSelectViewController:(ColorSelectViewController *)controller didFinishSelectColor:(TextColor *)color;

@end

@interface ColorSelectViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *colorToShow;

@property (nonatomic, weak) TextColor *textColorToShow;
@property (nonatomic, weak) id <ColorSelectViewControllerProtocol> delegate;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)done:(UIBarButtonItem *)sender;

- (IBAction)redSliderChangedValue:(UISlider *)sender;
- (IBAction)greenSliderChangedValue:(UISlider *)sender;
- (IBAction)blueSliderChangedValue:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;

@end
