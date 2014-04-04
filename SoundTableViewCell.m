//
//  SoundTableViewCell.m
//  AudioManager
//
//  Created by Icaro Nascimento Ferreira on 04/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "SoundTableViewCell.h"

@implementation SoundTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)playPauseBTtap:(id)sender {
    
//    UITableView* tableView = (UITableView *)self.superview;
//    NSIndexPath* pathOfTheCell = [tableView indexPathForCell:self];
//    NSInteger rowOfTheCell = pathOfTheCell.row;
//    NSLog(@"rowofthecell %d", rowOfTheCell);
    
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}

@end
