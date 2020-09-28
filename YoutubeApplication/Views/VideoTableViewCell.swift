//
//  VideoTableViewCell.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/28/20.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard video.self != nil
        
        else {
            return
        }
        
        
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
            
        }
        
        //check cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            // set thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        //Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session
        let session = URLSession.shared
        
        // Create a datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //Svae data in cache
                CacheManager.setVideoCache(url!.absoluteString,data)
                
                
                // check that the downloaded url matches the video
                //thumbnail url that this cell is currently set
                // to display
                
                
                if url!.absoluteString != self.video?.thumbnail {
                
                return
                
                }
                
                //Creating image object
                let image = UIImage(data: data!)
                
                // set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            
                
            }
        }
        
        //start data task
        dataTask.resume()
        
        
        
        
        
    }

}
