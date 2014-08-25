//
//  AllNotesViewController.h
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import <UIKit/UIKit.h>
#import "DetailNoteViewController.h"

@class DataModel;

@interface AllNotesViewController : UITableViewController
                                    <DetailNoteViewControllerProtocol, UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
