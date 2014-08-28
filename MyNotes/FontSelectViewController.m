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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_textFamily count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontCell"];
    
    [self configCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (void)configCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = _textFamily[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:_textFamily[indexPath.row] size:17];
    cell.textLabel.textColor = [UIColor colorWithRed:self.colorToShow.redColor
                                               green:self.colorToShow.greenColor
                                                blue:self.colorToShow.blueColor
                                               alpha:self.colorToShow.alphaColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate fontSelectViewController:self didFinishSelectFont:_textFamily[indexPath.row]];
}


@end
