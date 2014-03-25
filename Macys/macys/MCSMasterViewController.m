//
//  MCSMasterViewController.m
//  macys
//
//  Created by SystemsUSA on 3/24/14.
//  Copyright (c) 2014 SystemsUSA. All rights reserved.
//


#import "MCSMasterViewController.h"

#import "MCSDetailViewController.h"

#import "MCSDataStore.h"
#import "Product.h"

@interface MCSMasterViewController ()
@property (nonatomic, readonly) NSArray *products;
@end

@implementation MCSMasterViewController

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDataStoreDidLoadDataFromJSONNotification object:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"All Products";
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataStoreDidLoadDataFromJSONNotification:) name:kDataStoreDidLoadDataFromJSONNotification object:nil];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.navigationItem.title = @"All Products";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataStoreDidLoadDataFromJSONNotification:) name:kDataStoreDidLoadDataFromJSONNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObjectTapped:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Product *product = self.products[indexPath.row];
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = product.explonation;
    cell.imageView.image = product.productPhoto;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Product *product = self.products[indexPath.row];
        [[MCSDataStore sharedInstance] removeProduct:product];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Product *product = [MCSDataStore sharedInstance].products[indexPath.row];
    MCSDetailViewController *detailViewController = [[MCSDetailViewController alloc] init];
    detailViewController.detailItem = product;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#if 0
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.products[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}
#endif

#pragma mark - Notification responders

- (void)dataStoreDidLoadDataFromJSONNotification:(NSNotification*)notification {
    
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)insertNewObjectTapped:(id)sender
{
    Product *emptyProdyct = [[Product alloc] init];
    [[MCSDataStore sharedInstance] addProduct:emptyProdyct];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.products.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // process Action
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark - Getters and setters

- (NSArray *)products {
    
    return [MCSDataStore sharedInstance].products;
}

@end
