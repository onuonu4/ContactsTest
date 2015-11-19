//
//  ContactsJSON.m
//
//  Created by   on 19/11/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ContactsJSON.h"


NSString *const kContactsJSONAddress = @"address";
NSString *const kContactsJSONId = @"id";
NSString *const kContactsJSONSurname = @"surname";
NSString *const kContactsJSONEmail = @"email";
NSString *const kContactsJSONUpdatedAt = @"updatedAt";
NSString *const kContactsJSONCreatedAt = @"createdAt";
NSString *const kContactsJSONPhoneNumber = @"phone_number";
NSString *const kContactsJSONFirstName = @"first_name";


@interface ContactsJSON ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ContactsJSON

@synthesize addressL = _address;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize surname = _surname;
@synthesize email = _email;
@synthesize updatedAt = _updatedAt;
@synthesize createdAt = _createdAt;
@synthesize phoneNumber = _phoneNumber;
@synthesize firstName = _firstName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.addressL = [self objectOrNilForKey:kContactsJSONAddress fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kContactsJSONId fromDictionary:dict] doubleValue];
            self.surname = [self objectOrNilForKey:kContactsJSONSurname fromDictionary:dict];
            self.email = [self objectOrNilForKey:kContactsJSONEmail fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kContactsJSONUpdatedAt fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kContactsJSONCreatedAt fromDictionary:dict];
            self.phoneNumber = [self objectOrNilForKey:kContactsJSONPhoneNumber fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kContactsJSONFirstName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.addressL forKey:kContactsJSONAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kContactsJSONId];
    [mutableDict setValue:self.surname forKey:kContactsJSONSurname];
    [mutableDict setValue:self.email forKey:kContactsJSONEmail];
    [mutableDict setValue:self.updatedAt forKey:kContactsJSONUpdatedAt];
    [mutableDict setValue:self.createdAt forKey:kContactsJSONCreatedAt];
    [mutableDict setValue:self.phoneNumber forKey:kContactsJSONPhoneNumber];
    [mutableDict setValue:self.firstName forKey:kContactsJSONFirstName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.addressL = [aDecoder decodeObjectForKey:kContactsJSONAddress];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kContactsJSONId];
    self.surname = [aDecoder decodeObjectForKey:kContactsJSONSurname];
    self.email = [aDecoder decodeObjectForKey:kContactsJSONEmail];
    self.updatedAt = [aDecoder decodeObjectForKey:kContactsJSONUpdatedAt];
    self.createdAt = [aDecoder decodeObjectForKey:kContactsJSONCreatedAt];
    self.phoneNumber = [aDecoder decodeObjectForKey:kContactsJSONPhoneNumber];
    self.firstName = [aDecoder decodeObjectForKey:kContactsJSONFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_address forKey:kContactsJSONAddress];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kContactsJSONId];
    [aCoder encodeObject:_surname forKey:kContactsJSONSurname];
    [aCoder encodeObject:_email forKey:kContactsJSONEmail];
    [aCoder encodeObject:_updatedAt forKey:kContactsJSONUpdatedAt];
    [aCoder encodeObject:_createdAt forKey:kContactsJSONCreatedAt];
    [aCoder encodeObject:_phoneNumber forKey:kContactsJSONPhoneNumber];
    [aCoder encodeObject:_firstName forKey:kContactsJSONFirstName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ContactsJSON *copy = [[ContactsJSON alloc] init];
    
    if (copy) {

        copy.addressL = [self.addressL copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.surname = [self.surname copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.phoneNumber = [self.phoneNumber copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    
    return copy;
}


@end
