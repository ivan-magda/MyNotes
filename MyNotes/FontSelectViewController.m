//
//  FontSelectViewController.m
//  MyNotes
//
//  Created by Ivan Magda on 29.08.14.
//
//

#import "FontSelectViewController.h"
#import "TextColor.h"

@interface FontSelectViewController ()

@end

@implementation FontSelectViewController {
    NSArray *_textFamily;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textFamily = [UIFont familyNames];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_textFamily count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *fonts = [UIFont fontNamesForFamilyName:_textFamily[section]];
    return ([fonts count] + 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontCell" forIndexPath:indexPath];
    
    [self configCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (void)configCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = _textFamily[indexPath.section];
        cell.textLabel.font = [UIFont fontWithName:_textFamily[indexPath.row] size:17];
        cell.textLabel.textColor = [UIColor blackColor];
    } else {
        NSArray *styles = [UIFont fontNamesForFamilyName:_textFamily[indexPath.section]];
        cell.textLabel.text = styles[indexPath.row - 1];
        cell.textLabel.font = [UIFont fontWithName:styles[indexPath.row - 1] size:17];
        cell.textLabel.textColor = [UIColor colorWithRed:self.colorToShow.redColor
                                                   green:self.colorToShow.greenColor
                                                    blue:self.colorToShow.blueColor
                                                   alpha:self.colorToShow.alphaColor];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *styles = [UIFont fontNamesForFamilyName:_textFamily[indexPath.section]];
    
    [self.delegate fontSelectViewController:self didFinishSelectFont:styles[indexPath.row - 1]];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}


@end
