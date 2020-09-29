//
//  Constant.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/27/20.
//

import Foundation

struct Constants {
    
    static var  API_KEY = "AIzaSyAKSDBKbmnJRzTdNv5bxyO4gOYAMKNi-UI"
    static var PLAYLIST_ID = "PLMRqhzcHGw1ZkH8RuznGMS0NZs0jWQQ5a"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YOUTUBE_EMBED_URL = "https://www.youtube.com/embed/"
}
