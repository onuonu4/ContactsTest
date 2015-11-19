//
//  ContactView.h
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsView.h"
#import "ContactsJSON.h"

@interface ContactView : UIViewController


@property(strong,nonatomic) id contact;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *surnameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

@property (weak, nonatomic) IBOutlet UILabel *updatedAtLabel;

@end
