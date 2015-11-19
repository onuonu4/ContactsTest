//
//  ContactsView.h
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsJSON.h"
#import "Record.h"
#import "AppDelegate.h"

@interface ContactsView : UIViewController{
    
    NSMutableData *data;
    
    ContactsJSON *contact;
    
    NSMutableArray *contacts;
    
    Record* newEntry;
    
    Record* record;
    
    AppDelegate* appDelegate;

}

@property (weak, nonatomic) IBOutlet UITableView *contactsTable;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic,strong)NSArray* fetchedUser;

@end
