//
//  ViewController.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/27/20.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        
        model.getVideos()
        
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        
        //Confirm the video was selected
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
            
        }
        
        // Get a reference of the video thatt was tapped on
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        
        
        // Get a reference to detailed view controller
        
        let detailVC = seque.destination as! DetailViewController
        
        
        // set the video property of detailed view controller
        detailVC.video = selectedVideo
        
        
        
        
    }
    
    //MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        //set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        
        // configure the cell with data
        // get the title for the videos in question
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        
        //return cell
        return cell
        
    }


}

