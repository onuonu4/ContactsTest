//
//  Record.h
//  RadarMeApp
//
//  Created by Onu Flavian on 02/09/14.
//  Copyright (c) 2014 Get That Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic,retain) NSData* storedContacts;

@end
