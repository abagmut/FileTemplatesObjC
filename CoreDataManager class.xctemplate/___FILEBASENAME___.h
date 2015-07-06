//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <CoreData/CoreData.h>


typedef enum
{
	Entity_,
}Entity;


@interface ___FILEBASENAMEASIDENTIFIER___ : NSObject

+ (instancetype)shared___FILEBASENAMEASIDENTIFIER___;

- (BOOL)saveContext;


- (NSString*)entityName: (Entity)entity;


// Actions with items
//
- (id)insertNewObjectForEntity: (Entity)entity;
- (id)createNewObjectWithoutContextForEntity: (Entity)entity;

- (void)removeObject: (NSManagedObject*)object;
- (void)removeObjects: (NSArray*)objects;


// Fetche
//
- (id)fetchObjectForEntity: (Entity)entity
			 withPredicate: (NSPredicate*)predicate;
- (id)fetchObjectsForEntity: (Entity)entity;


// Clear
//
- (void)clearEntityWithName: (NSString*)entityName;

- (void)clearDatabase;

@end
