//
//  FISPlaylistTableViewController.m
//  Jukebox-TableViews
//
//  Created by Yoseob Lee on 6/17/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISPlaylistTableViewController.h"

@interface FISPlaylistTableViewController ()
@property (nonatomic, strong) FISPlaylist *playlist;
@property (nonatomic, strong) NSMutableArray *playlistArray;
@property (nonatomic, strong) NSArray *nameArray;

@end

@implementation FISPlaylistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playlistArray = [[NSMutableArray alloc]init];
    self.nameArray = [@[@"Bracket Sounds", @"Songs to Code By", @""]mutableCopy];
    
    self.tableView.accessibilityIdentifier = @"Playlist";
    
    for (NSString *names in self.nameArray){
        self.playlist = [[FISPlaylist alloc]initWithName:names];
        [self.playlistArray addObject:self.playlist];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.playlistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    NSUInteger cellRow = indexPath.row;
    
    FISPlaylist *placeholderPlaylist = self.playlistArray[cellRow];
    NSNumber *numberOfSongs = [NSNumber numberWithInteger:placeholderPlaylist.songs.count];
    
    cell.textLabel.text = placeholderPlaylist.name;
    cell.detailTextLabel.text = [numberOfSongs stringValue];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FISSongViewController *destinationViewController = segue.destinationViewController;
    
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    NSUInteger selectedNumber = selectedIndexPath.row;
    
    FISPlaylist *placeholderPlaylist = self.playlistArray[selectedNumber];
    
    destinationViewController.playlist = placeholderPlaylist;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
