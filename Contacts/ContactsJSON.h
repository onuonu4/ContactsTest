//
//  ContactsJSON.h
//
//  Created by   on 19/11/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ContactsJSON : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *addressL;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *firstName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
