//
//  ContactsView.m
//  Contacts
//
//  Created by flav Onu on 19/11/2015.
//  Copyright © 2015 Flavian. All rights reserved.
//

#import "ContactsView.h"
#import "CustomContactCell.h"
#import "ContactView.h"

@interface ContactsView ()

@end

@implementation ContactsView

@synthesize fetchedUser,managedObjectContext;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    appDelegate = [UIApplication sharedApplication].delegate;
    
    managedObjectContext = appDelegate.managedObjectContext;
    
    fetchedUser = [appDelegate getUserData];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://fast-gorge.herokuapp.com/contacts"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [NSMutableData alloc].init;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [data appendData:theData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSMutableArray *res = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    contacts = [[NSMutableArray alloc]init];
    
    
    for (int i=0; i<[res count]; i++) {
    
        contact = [[ContactsJSON alloc]initWithDictionary:(NSDictionary*)[res objectAtIndex:i]];
        
        [contacts addObject:contact];
    
    }
    
    newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"SavedDataUser" inManagedObjectContext:self.managedObjectContext];
    
    NSData *fetchedContacts = [NSKeyedArchiver archivedDataWithRootObject:contacts];
    
    newEntry.storedContacts = fetchedContacts;
    
    NSError *error;
    
    if (![self.managedObjectContext save:&error]) {
        
    }
    
    [_contactsTable reloadData];

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error " message:@"The download could not complete - please make sure that you have 3G or Wi-Fi enabled. Until you enter again we will use the contacts stored in your phone!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    
    [errorView show];
    
    contacts = [NSKeyedUnarchiver unarchiveObjectWithData:[[fetchedUser lastObject] storedContacts]];

    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [_contactsTable reloadData];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (int)[contacts count];
}

-(CustomContactCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomContactCell *cell  =  (CustomContactCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell7"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomContactCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    cell.contactFirstName.text = [[contacts objectAtIndex:indexPath.row] firstName];
    cell.contactLastName.text = [[contacts objectAtIndex:indexPath.row] surname];
    
    NSString* avatarUrlString = [[NSString alloc]initWithFormat:@"http://api.adorable.io/avatars/285/%@.png",[[contacts objectAtIndex:indexPath.row]email] ];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: avatarUrlString]];
    
    cell.contactAvatar.image = [UIImage imageWithData: imageData];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"view_contact" sender:[contacts objectAtIndex:indexPath.row]];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"view_contact"]) {
        ContactView *destViewController = segue.destinationViewController;
        
        destViewController.contact = sender;
        
    }
}


@end
