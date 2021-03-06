//
//  AppDelegate.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/7/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MainMenuViewController.h"
#import "Hotel.h"
#import "Room.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
  [self seedCoreDataIfNeeded];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.window makeKeyAndVisible];
  
  MainMenuViewController *mainMenuView = [[MainMenuViewController alloc] init];
  UINavigationController *navControllerView = [[UINavigationController alloc] initWithRootViewController:mainMenuView];
  
  ViewController *rootView = [[ViewController alloc] init];
  rootView.view.backgroundColor = [UIColor blueColor];
  self.window.rootViewController = navControllerView;
  
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}

#pragma mark - Shared AppDelegate
+ (AppDelegate *)sharedAppDelegate
{
  return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "MC.HotelManager" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HotelManager" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    	
    // Create the coordinator and store
    
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HotelManager.sqlite"];
  NSError *error = nil;
  NSString *failureReason = @"There was an error creating or loading the application's saved data.";
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    // Replace this with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Seed Core Data Method
-(void)seedCoreDataIfNeeded{

//  Uncomment to wipe out data
//  source: http://stackoverflow.com/questions/1383598/core-data-quickest-way-to-delete-all-instances-of-an-entity

//  NSFetchRequest *allHotels = [[NSFetchRequest alloc] init];
//  [allHotels setEntity:[NSEntityDescription entityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext]];
//  [allHotels setIncludesPropertyValues:NO]; //only fetch the managedObjectID
//  
//  NSError *error = nil;
//  NSArray *hotels = [self.managedObjectContext executeFetchRequest:allHotels error:&error];
//  //error handling goes here
//  for (NSManagedObject *hotel in hotels) {
//    [self.managedObjectContext deleteObject:hotel];
//  }
//  NSError *saveError = nil;
//  [self.managedObjectContext save:&saveError];
//

  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSError *fetchError;
  NSInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:&fetchError];
  
  if (count == 0) {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    NSError *jsonError;
    NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    if (jsonError){
      return;
    }
    else{
    
    NSArray *hotels = rootObject[@"Hotels"];
      
      for (NSDictionary *hotel in hotels) {
        
        NSString *name = hotel[@"name"];
        NSString *location = hotel[@"location"];
        NSNumber *stars = hotel[@"stars"];
        NSArray *rooms = hotel[@"rooms"];
        Hotel *hotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
        hotel.name = name;
        hotel.location = location;
        hotel.stars = stars;
        
        for (NSDictionary *room in rooms) {
        
        NSNumber *roomNumber = room[@"number"];
        NSNumber *beds = room[@"beds"];
        NSNumber *rate = room[@"rate"];
        Room *room = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
        room.number = roomNumber;
        room.beds = beds;
        room.rate = rate;
        room.hotel = hotel;
        
        }
      }
      
      NSError *saveError;
      BOOL result = [self.managedObjectContext save:&saveError];
      if (!result) {
        NSLog(@" %@",saveError.localizedDescription);
    }
  }
}

  
//  Hotel *hotel1 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//  hotel1.name = @"Baller On A Budget Hotel";
//  hotel1.stars = @4;
//
//  Hotel *hotel2 = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
//  hotel2.name = @"Basement Price Hotel";
//  hotel2.stars = @2;
//  
//  Room *room1 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//  room1.number = @206;
//  room1.hotel = hotel1;
//  
//  Room *room2 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//  room2.number = @425;
//  room2.hotel = hotel1;
//  
//  Room *room3 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//  room3.number = @916;
//  room3.hotel = hotel2;
//  
//  Room *room4 = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
//  room4.number = @415;
//  room4.hotel = hotel2;
  
//  NSError *saveError;
//  BOOL result = [self.managedObjectContext save:&saveError];
//  if (!result) {
//    NSLog(@"%@", saveError.description);
//  }
//  
}

@end
