//
//  ReservationViewController.m
//  HotelManager
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "ReservationViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "Room.h"
#import "Reservation.h"
#import "ConfirmReservationViewController.h"

@interface ReservationViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSArray *rooms;
@property (strong, nonatomic) NSArray *hotels;
@property (nonatomic, strong) UITableView *tableView;
@property (retain, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ReservationViewController

- (void)loadView{
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  self.tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStyleGrouped];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:self.tableView];
  
  NSDictionary *views = @{@"tableView" : self.tableView};
  
  NSArray *roomListTableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:roomListTableViewHorizontalConstraints];
  
  NSArray *roomListTableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:roomListTableViewVerticalConstraints];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title = @"Rooms Available for Booking";
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  NSError *error;
  if (![[self fetchedResultsController] performFetch:&error]) {
    NSLog(@"error %@, %@", error, [error userInfo]);
    exit(-1);
  }
 
}
#pragma mark - NSFetchedResultsController
- (NSFetchedResultsController *)fetchedResultsController {
  if (_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  //Create 1st predicate with start and end date parameter
  //Retrieve all rooms within that params
  //Store the rooms into an blocked out room array
  //Set up another fetch
  
  // Try to create one predicate... for the filtering rooms based on date
  
  AppDelegate* appDelegate = [AppDelegate sharedAppDelegate];
  NSManagedObjectContext* context = appDelegate.managedObjectContext;
  
  NSFetchRequest *fetchReservationsRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Reservation" inManagedObjectContext:context];
  [fetchReservationsRequest setEntity:entity];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@",self.endDate,self.startDate];
  fetchReservationsRequest.predicate = predicate;
  NSError *fetchError;
  NSArray *results = [context executeFetchRequest:fetchReservationsRequest error:&fetchError];
  
  // Loop through results to retrieve room and set it to unavailable rooms array
  NSMutableArray *blockedRooms = [[NSMutableArray alloc] init];
  for (Reservation *reservation in results) {
    [blockedRooms addObject:reservation.room];
  }
  
  //Fetches all rooms that are not in the room parameter
  NSFetchRequest *finalRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *finalPredicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", blockedRooms];
  finalRequest.predicate = finalPredicate;
  NSError *finalError;
  
  if (finalError) {
    return nil;
  }
  
  NSSortDescriptor *sortRoomsByHotel = [[NSSortDescriptor alloc] initWithKey:@"hotel.name" ascending:NO];
  NSSortDescriptor *sortRoomsByNumber = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES];
  
  finalRequest.sortDescriptors = @[sortRoomsByHotel, sortRoomsByNumber];
  
  NSFetchedResultsController *theFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:finalRequest managedObjectContext:context sectionNameKeyPath:@"hotel.name" cacheName:nil];
  self.fetchedResultsController = theFetchedResultsController;
  self.fetchedResultsController.delegate = self;
  return self.fetchedResultsController;
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [[[self.fetchedResultsController sections] objectAtIndex:section] name];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  NSLog(@"%lu", (unsigned long)self.fetchedResultsController.sections.count);
  return self.fetchedResultsController.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  id sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
  return [sectionInfo numberOfObjects];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  Room *room = [self.fetchedResultsController objectAtIndexPath:indexPath];
  cell.textLabel.text = [NSString stringWithFormat:@"%@", room.number];
  cell.detailTextLabel.text = [NSString stringWithFormat:@"Number of Beds: %@, Rate: $%@", room.beds, room.rate];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  [self configureCell:cell atIndexPath:indexPath];
  return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:true];
  ConfirmReservationViewController *confirmReservationVC = [[ConfirmReservationViewController alloc]init];
  confirmReservationVC.selectedRoom = [self.fetchedResultsController objectAtIndexPath:indexPath];
  confirmReservationVC.startDate = self.startDate;
  confirmReservationVC.endDate = self.endDate;
  [self.navigationController pushViewController:confirmReservationVC animated:true];
}

#pragma mark - NSFetchedResultsController Delegate Boiler Plate Code from Apple
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
  [self.tableView beginUpdates];
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {

  [self.tableView endUpdates];
}

@end
