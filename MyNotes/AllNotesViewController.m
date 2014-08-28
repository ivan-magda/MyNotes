//
//  AllNotesViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import "AllNotesViewController.h"
#import "DataModel.h"
#import "TextColor.h"
#import "Note.h"

static const NSUInteger kAllNotesTextCellLabel = 100;
static const NSUInteger kAllNotesDateCellLabel = 101;

@interface AllNotesViewController ()

@end

@implementation AllNotesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
    
    NSInteger index = [self.dataModel indexOfSelectedNote];
    
    if (index >= 0 && index < [self.dataModel.notes count]) {
        Note *note = self.dataModel.notes[index];
        
        [self performSegueWithIdentifier:@"ShowNote" sender:note];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataModel.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    Note *note = self.dataModel.notes[indexPath.row];
    
    [self configTextForCell:cell withNote:note];
    
    return cell;
}

- (void)configTextForCell:(UITableViewCell *)cell withNote:(Note *)note
{
    UILabel *label = (UILabel *)[cell viewWithTag:kAllNotesTextCellLabel];
    label.text = note.text;
    label.font = [UIFont fontWithName:note.textFamily size:(CGFloat)note.textSize];
    
    UIColor *color = [UIColor colorWithRed:note.textColor.redColor green:note.textColor.greenColor blue:note.textColor.blueColor alpha:note.textColor.alphaColor];
    label.textColor = color;
    
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:kAllNotesDateCellLabel];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    dateLabel.text = [dateFormatter stringFromDate:note.date];
    dateLabel.textColor = dateLabel.tintColor;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataModel.notes removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddNote"]) {
        DetailNoteViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        controller.itemToShow = nil;
    } else if ([segue.identifier isEqualToString:@"ShowNote"]) {
        DetailNoteViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        controller.itemToShow = sender;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataModel setIndexOfSelectedNote:indexPath.row];
    
    Note *note = self.dataModel.notes[indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowNote" sender:note];
}

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishAddingNote:(Note *)note {
    NSInteger newIndex = [self.dataModel.notes count];
    
    [self.dataModel.notes addObject:note];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishShowNote:(Note *)note {
    NSInteger index = [self.dataModel.notes indexOfObject:note];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self configTextForCell:cell withNote:note];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation controler delegate -

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self) {
        [self.dataModel setIndexOfSelectedNote:-1];
    }
}

@end
