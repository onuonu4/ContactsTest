//
//  ContactView.m
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import "ContactView.h"

@interface ContactView ()

@end

@implementation ContactView

@synthesize contact,avatarImage,firstNameLabel,surnameLabel,addressLabel,phoneLabel,emailLabel,createdAtLabel,updatedAtLabel;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString* avatarUrlString   =   [[NSString alloc]initWithFormat:@"http://api.adorable.io/avatars/285/%@.png", [contact email]];
    
    NSData * imageData          =   [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: avatarUrlString]];
    
    avatarImage.image           =   [UIImage imageWithData:imageData];
    
    firstNameLabel.text         =   [contact firstName];
    
    surnameLabel.text           =   [contact surname];
    
    addressLabel.text           =   [contact addressL];
    
    phoneLabel.text             =   [contact phoneNumber];
    
    emailLabel.text             =   [contact email];
    
    createdAtLabel.text         =   [self convertDate: [contact createdAt]];
    
    updatedAtLabel.text         =   [self convertDate: [contact updatedAt]];
    
    self.title                  =   [contact firstName];
    
    [self makePretty];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)makePretty{
    
    avatarImage.layer.cornerRadius = 140;
    
    avatarImage.layer.borderColor = [[UIColor blackColor]CGColor];
    
    avatarImage.layer.borderWidth  = 0.7;
    
    avatarImage.clipsToBounds = YES;

}

-(NSString*)convertDate:(NSString*)dateInput{

    NSString *dateString            =   dateInput;
    
    NSDateFormatter *formatter      =   [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    
    NSLocale *posix                 =   [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [formatter setLocale:posix];
    
    NSDate *date                    =   [formatter dateFromString:dateString];

    [formatter setDateFormat:@"dd-MMM-yyyy"];
    
    NSString *formattedDateString   =   [formatter stringFromDate:date];

    return formattedDateString;

}



@end
