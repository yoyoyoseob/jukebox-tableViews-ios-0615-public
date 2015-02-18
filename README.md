---
  tags: tutorial, intermediate, Table-Views
  languages: objc
---

Jukebox-TableViews
=========

### Goals 

- Get even more familiar with Table View Controllers... We'll be using them all the time! 
- Re-configure an existing application to use Table View Controllers. 


Let's take the Jukebox lab and use Table Views to more efficiently layout our playlists.    


### Instructions 

1. Add a Navigation Controller and embed a Table View Controller.

- The first Table View Controller will display a list of playlists.  The title for each cell will display the name of the playlist (you'll have to add a name property to your Playlist object).  The subtitle will display the number of songs in the playlist.  

- When clicking on a playlist, you'll push a new ViewController onto the stack.  This View Controller will subclass UIViewController  (Not UITableViewController), but it will contain a Table View.  Make sure you set this View Controller to conform to the UITableViewDelegate and UITableViewDataSource Protocols.  

The Table View will display the list of songs in the playlist.  All of the other functionality from the Jukebox should still exist: 

- Tapping a cell should play the song in that cell 
- You should employ the services of a stop button to stop the current playing song.  
- You should have a button to Sort by: Title (Clicking this button will rearrange the items in the table view) 
- You should have a button to Sort by: Artist (Clicking this button will rearrange the items in the table view)
- You should have a button to Sort by: Album   (Clicking this button will rearrange the items in the table view)  

- You should also create an interface to show information about the current playing song.  Be creative and if you have extra time, make it pretty.  

### Hints

When adding a tableview to your viewcontroller, create an `IBOutlet` for your tableview. Then add <UITableViewDataSource, UITableViewDelegate> to the `.h` file of your view controller next to the `: UIViewController` part. Then in `viewDidLoad` add in `self.myTableView.delegate = self` and `self.myTableView.dataSource = self`

### Extra Credit 

- Create a modal that when presented lists all of the songs and allows an additional song to be added to the playlist.  



