//
//  Model.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/27/20.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //Create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            
            return
            
        }
        // Get a URL session object
        
        let session = URLSession.shared
        
        
        // Get a data task from the URL Session object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there are any errors
            
            if error != nil || data == nil {
                
                return
            }
            
            do {
                // parsing data implementation
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let response = try decoder.decode(Response.self, from: data!)
                    dump(response)
                
            }
            catch {
                
            }
            
        
            
            
        }
        
        // Kickoff the task
        dataTask.resume()
        
    }
}
