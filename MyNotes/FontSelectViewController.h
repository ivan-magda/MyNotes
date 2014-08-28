//
//  FontSelectViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 29.08.14.
//
//

#import <UIKit/UIKit.h>

@class FontSelectViewController;
@class TextColor;

@protocol FontSelectViewControllerProtocol <NSObject>

- (void)fontSelectViewController:(FontSelectViewController *)controller didFinishSelectFont:(NSString *)fontName;

@end

@interface FontSelectViewController : UITableViewController

@property (nonatomic, weak) id <FontSelectViewControllerProtocol> delegate;
@property (nonatomic, weak) TextColor *colorToShow;

@end
