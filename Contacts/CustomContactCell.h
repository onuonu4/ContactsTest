//
//  CustomContactCell.h
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContactCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *contactAvatar;
@property (weak, nonatomic) IBOutlet UILabel *contactFirstName;
@property (weak, nonatomic) IBOutlet UILabel *contactLastName;
@end
