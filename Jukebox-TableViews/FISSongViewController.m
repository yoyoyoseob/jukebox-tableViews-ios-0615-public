//
//  FISSongViewController.m
//  Jukebox-TableViews
//
//  Created by Yoseob Lee on 6/17/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISSongViewController.h"
#import "FISSong.h"

@interface FISSongViewController ()
@property (nonatomic) BOOL isPlaying;
@property (weak, nonatomic) IBOutlet UITableView *songTableView;
@property (weak, nonatomic) IBOutlet UIProgressView *songProgressView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *songButton;
@property (weak, nonatomic) IBOutlet UILabel *currentSongLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentSongDetailLabel;


- (IBAction)segmentedControlAction:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;

@end

@implementation FISSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.songTableView.delegate = self;
    self.songTableView.dataSource = self;
    self.isPlaying = NO;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.playlist.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    NSUInteger cellRow = indexPath.row;
    
    FISSong *song = self.playlist.songs[cellRow];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Artist: %@ | Album: %@", song.artist, song.album];
    
    // Configure the cell...
    
    return cell;
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentedControlAction:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0){
        [self.playlist sortSongsByTitle];
//        [self.songTableView reloadData];
    }
    if (self.segmentedControl.selectedSegmentIndex == 1){
        [self.playlist sortSongsByArtist];
//        [self.songTableView reloadData];
    }
    if (self.segmentedControl.selectedSegmentIndex == 2){
        [self.playlist sortSongsByAlbum];
//        [self.songTableView reloadData];
    }
    [self.songTableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.isPlaying = NO;
    NSUInteger selectedNumber = indexPath.row;
    
    FISSong *placeholderSong = self.playlist.songs[selectedNumber];
    
    [self.songProgressView setProgress:0.0];
    
    if (self.isPlaying == NO){
        [self setupAVAudioPlayWithFileName:placeholderSong.fileName];
        [NSTimer scheduledTimerWithTimeInterval:1.0/120.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
        [self.audioPlayer play];
        self.isPlaying = YES;
        [self.songButton setBackgroundImage:[UIImage imageNamed:@"stop_icon.png"] forState:UIControlStateNormal];
        self.currentSongLabel.text = placeholderSong.title;
        self.currentSongLabel.hidden = NO;
        self.currentSongDetailLabel.text = [NSString stringWithFormat:@"Artist: %@ | Album: %@", placeholderSong.artist, placeholderSong.album];
        self.currentSongDetailLabel.hidden = NO;
    }

}

-(void)updateTime:(NSTimer *)timer
{
    [self.songProgressView setProgress:(self.audioPlayer.currentTime/self.audioPlayer.duration)];
}

- (IBAction)stopButtonTapped:(id)sender {

    UIButton *button = (UIButton *)sender;
    
    if (self.isPlaying == NO){
        [self.audioPlayer play];
        self.isPlaying = YES;
        [button setBackgroundImage:[UIImage imageNamed:@"stop_icon.png"] forState:UIControlStateNormal];
        [self.songTableView reloadData];
    }
    else {
        [self.audioPlayer stop];
        self.isPlaying = NO;
        [button setBackgroundImage:[UIImage imageNamed:@"play_icon.png"] forState:UIControlStateNormal];
        [self.songTableView reloadData];
    }
}

@end
