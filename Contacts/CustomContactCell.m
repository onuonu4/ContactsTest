//
//  CustomContactCell.m
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import "CustomContactCell.h"

@implementation CustomContactCell

@synthesize contactAvatar,contactFirstName,contactLastName;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
