//
//  AllNotesViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 24.08.14.
//
//

#import "AllNotesViewController.h"
#import "Note.h"

static const NSUInteger kAllNotesCellLabel = 100;
static const NSUInteger kAllNotesCellDetailLabel = 101;

@interface AllNotesViewController ()

@end

@implementation AllNotesViewController {
    NSMutableArray *_notes;
}

- (NSString *)documentsDirectory {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [array firstObject];
}

- (NSString *)dataFilePath {
    return [[self documentsDirectory]stringByAppendingPathComponent:@"Notes.plist"];
}

- (void)saveToFile {
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:_notes forKey:@"Notes"];
    [archiver finishEncoding];
    
    [data writeToFile:[self dataFilePath] atomically:NO];
}

- (void)loadFromFile {
    NSString *dataFilePath = [self dataFilePath];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:dataFilePath]) {
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]
                                         initForReadingWithData:data];
        _notes = [unarchiver decodeObjectForKey:@"Notes"];
        [unarchiver finishDecoding];
    } else {
        _notes = [[NSMutableArray alloc]initWithCapacity:20];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self loadFromFile];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    Note *note = _notes[indexPath.row];
    
    [self configTextForCell:cell withNote:note];
    
    cell.detailTextLabel.textColor = cell.detailTextLabel.tintColor;
    
    return cell;
}

- (void)configTextForCell:(UITableViewCell *)cell withNote:(Note *)note {
    UILabel *label = (UILabel *)[cell viewWithTag:kAllNotesCellLabel];
    label.text = note.text;
    
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:kAllNotesCellDetailLabel];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    detailLabel.text = [dateFormatter stringFromDate:note.date];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_notes removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self saveToFile];
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
    Note *note = _notes[indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowNote" sender:note];
}

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishAddingNote:(Note *)note {
    NSInteger newIndex = [_notes count];
    
    [_notes addObject:note];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self saveToFile];
}

- (void)detailNoteViewController:(DetailNoteViewController *)controller didFinishShowNote:(Note *)note {
    NSInteger index = [_notes indexOfObject:note];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self configTextForCell:cell withNote:note];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self saveToFile];
}

@end
