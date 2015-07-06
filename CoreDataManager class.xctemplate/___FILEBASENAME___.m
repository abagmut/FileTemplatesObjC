//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___.h"

#import <sys/xattr.h>


@interface ___FILEBASENAMEASIDENTIFIER___()
	@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
	@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
	@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
	@property (nonatomic, readonly) NSURL* persistentStoreURL;
@end


@implementation ___FILEBASENAMEASIDENTIFIER___


+ (instancetype)shared___FILEBASENAMEASIDENTIFIER___
{
	static ___FILEBASENAMEASIDENTIFIER___* instance = nil;
	
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{
		instance = [[self alloc] init];
	});
	return instance;
}

- (id) init
{
	if ((self = [super init]))
	{
	}
	
	return self;
}

#pragma mark - Core Data stack

- (NSManagedObjectContext*)managedObjectContext
{
    if (_managedObjectContext)
	{
        return _managedObjectContext;
    }
	
    if (self.persistentStoreCoordinator)
	{
        _managedObjectContext = [NSManagedObjectContext new];
		_managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel*)managedObjectModel
{
    if (_managedObjectModel)
	{
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource: @"<#Name#>"
											  withExtension: @"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator)
	{
        return _persistentStoreCoordinator;
    }
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType: NSSQLiteStoreType
												   configuration: nil
															 URL: self.persistentStoreURL
														 options: nil
														   error: &error])
	{
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
	[self addSkipBackupAttributeToItemAtURL: self.persistentStoreURL];
    
    return _persistentStoreCoordinator;
}

- (BOOL)addSkipBackupAttributeToItemAtURL: (NSURL*)URL
{
	assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
	NSLog(@"Add backup attribute to file %@", [URL path]);
	if (&NSURLIsExcludedFromBackupKey)
	{
		NSError* error = nil;
		BOOL success = [URL setResourceValue: @YES
		                              forKey: NSURLIsExcludedFromBackupKey
			                           error: &error];
		if (!success)
			NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
		
		return success;
		
	}
	else
	{
		const char* filePath = [[URL path] fileSystemRepresentation];
		const char* attrName = "com.apple.MobileBackup";
		u_int8_t attrValue = 1;
		int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
		
		return result == 0;
	}
}

- (NSURL*)persistentStoreURL
{
	return [NSURL fileURLWithPath: [NSString stringWithFormat: @"%@/Documents/<#Name#>.sqlite",
									NSHomeDirectory()]];
}


#pragma mark - Context

- (BOOL)saveContext
{
    NSManagedObjectContext* managedObjectContext = self.managedObjectContext;
    if (managedObjectContext)
	{
        if ([managedObjectContext hasChanges] &&
			![managedObjectContext save: nil])
		{
			return NO;
        }
    }
	
	return YES;
}


#pragma mark - Entities

- (NSString*)entityName: (Entity)entity
{
	switch (entity)
	{
		case Entity_:
		{
			return @"Entity__";
		}
			break;
			
		default:
			break;
	}
}


#pragma mark - Operation with items

- (id)insertNewObjectForEntity: (Entity)entity
{
	return [self insertNewObjectForEntityForName: [self entityName: entity]];
}

- (id)createNewObjectWithoutContextForEntity: (Entity)entity
{
	return [[NSManagedObject alloc] initWithEntity: [NSEntityDescription entityForName: [self entityName: entity]
																inManagedObjectContext: self.managedObjectContext]
					insertIntoManagedObjectContext: nil];
}

- (id)insertNewObjectForEntityForName: (NSString*)name
{
	if (!name)
		return nil;
	
	return [NSEntityDescription insertNewObjectForEntityForName: name
	                                     inManagedObjectContext: self.managedObjectContext];
}


- (void)removeObject: (NSManagedObject*)object
{
	[self.managedObjectContext deleteObject: object];
	[self saveContext];
}

- (void)removeObjects: (NSArray*)objects
{
	for (NSManagedObject* object in objects)
		[self.managedObjectContext deleteObject: object];
	[self saveContext];
}


#pragma mark - Fetch

- (id)fetchObjectForEntity: (Entity)entity
			 withPredicate: (NSPredicate*)predicate
{
	return [self fetchObjectForEntityForName: [self entityName: entity]
							   withPredicate: predicate];
}

- (id)fetchObjectsForEntity: (Entity)entity
{
	return [self fetchObjectsForEntityForName: [self entityName: entity]];
}

- (id)fetchObjectForEntityForName: (NSString*)name
                    withPredicate: (NSPredicate*)predicate
{
	if (!name)
		return nil;
	
	NSEntityDescription* entity = [NSEntityDescription entityForName: name
	                                          inManagedObjectContext: self.managedObjectContext];
	
	NSFetchRequest* request = [NSFetchRequest new];
	request.entity = entity;
	request.predicate = predicate;
	[request setReturnsObjectsAsFaults: NO];
	
	NSArray* results = [self.managedObjectContext executeFetchRequest: request
	                                                            error: nil];
	return results;
}

- (id)fetchObjectsForEntityForName: (NSString*)name
{
	if (!name)
		return nil;
	
	NSEntityDescription* entity = [NSEntityDescription entityForName: name
	                                          inManagedObjectContext: self.managedObjectContext];
	
	
	NSFetchRequest* request = [NSFetchRequest new];
	
	request.entity = entity;
	request.returnsObjectsAsFaults = NO;
	
	NSArray* results = [self.managedObjectContext executeFetchRequest: request
	                                                            error: nil];
	
	return results;
}


#pragma mark - Clear

- (void)clearEntityWithName: (NSString*)entityName
{
	NSFetchRequest* fetchRequest = [NSFetchRequest new];
	
	[fetchRequest setEntity: [NSEntityDescription entityForName: entityName
										 inManagedObjectContext: self.managedObjectContext]];
	[fetchRequest setIncludesPropertyValues: NO]; //only fetch the managedObjectID
	
	
	NSArray* items = [self.managedObjectContext executeFetchRequest: fetchRequest
															  error: nil];
	for (NSManagedObject* item in items)
	{
		[self.managedObjectContext deleteObject: item];
	}
	
	[self saveContext];
}

- (void)clearDatabase
{
	// Remove persistent store (underlying sqlite database)
	[[NSFileManager defaultManager] removeItemAtURL: self.persistentStoreURL
	                                          error: nil];
	
	// Null database linked objects
	self.managedObjectContext = nil;
	self.managedObjectModel = nil;
	self.persistentStoreCoordinator = nil;
}

@end
