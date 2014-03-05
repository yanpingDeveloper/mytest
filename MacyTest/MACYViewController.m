//
//  MACYViewController.m
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYViewController.h"
#import "MACYActionButtonsView.h"
#import "MACYProductDetailViewController.h"



@interface MACYViewController ()<NSFetchedResultsControllerDelegate>

@property(nonatomic) UITableView * tableView;
@property(nonatomic) MACYActionButtonsView * actionView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;



@end

@implementation MACYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
    if(self.tableView){
        
        [self.tableView reloadData];
    }
        
}
- (void)setUpViews{
    
    //create tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kScreenStarting + kScreenPadding,kScreenWidth, kScreenHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.hidden = YES;
    [self.view addSubview:self.tableView];
   
    [self performFetchRequest];
    
    //create actionView
    self.actionView = [[MACYActionButtonsView alloc]initWithFrame:CGRectMake(0,kScreenStarting ,kScreenWidth, kActionViewHeight) createProductBlock:^{
        
        NSLog(@"create production clicked");
        NSDictionary * response =  [[MACYDataManager sharedManager] makeMockProductData];
        
        [[MACYDataManager sharedManager] creatProductFromJsonData:response];
        
        
    } showProductBlock:^{
        
        NSLog(@"show production clicked");
        self.tableView.hidden = !self.tableView.hidden;
        
    }];
    
    [self.view addSubview:self.actionView];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo =
	[[_fetchedResultsController sections] objectAtIndex:section];
    
    return  [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    Product* info = [[_fetchedResultsController fetchedObjects] objectAtIndex:indexPath.row];
     static NSString * identity = @"normalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    
    cell.imageView.image = [UIImage imageNamed:info.photoURL];
    cell.textLabel.text = info.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Product* info = [[_fetchedResultsController fetchedObjects] objectAtIndex:indexPath.row];
    
    MACYProductDetailViewController * viewController = [[MACYProductDetailViewController alloc] initWithProduct:info];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    [NSFetchedResultsController deleteCacheWithName:@"ProductRoot"];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                               entityForName:@"Product" inManagedObjectContext:[[MACYDataManager sharedManager] managedObjectContext]];
    [fetchRequest setEntity:entity];


    NSSortDescriptor *sortDate = [[NSSortDescriptor alloc]
                                  initWithKey:@"pId" ascending:YES];

    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDate, nil]];
    [fetchRequest setFetchBatchSize:20];


    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                    managedObjectContext:[[MACYDataManager sharedManager] managedObjectContext] sectionNameKeyPath:nil
                                               cacheName:@"ProductRoot"];
    
    _fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
	
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            //  [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    
    [self.tableView endUpdates];
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

#pragma local method

- (void) performFetchRequest{
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        
        exit(-1);
    }

}

@end
