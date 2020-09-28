//
//  Video.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/27/20.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case videoId = "videoId"
        case title = "title"
        case description = "description"
        case thumbnail = "url"
        case published = "publishedAt"
        case snippet
        case thumbnails
        case high
        case resourceId
        
    }
    
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // parase thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self,forKey: .thumbnail)
        
        // parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
    
    
}

