//
//  MovieData.swift
//  Popcorn
//
//  Created by Alfian on 9/26/16.
//  Copyright © 2016 AlfianAlfian. All rights reserved.
//

import SwiftyJSON

struct MovieData {
  var strId: String
  var strImdbId: String
  var strTitle: String
  var strYear: String
  var strSynopsis: String
  var strRunTime: String
  var strGenres: String
  var strImgPoster: String
  var strImgFanArt: String
  var strImgBanner: String
  var intRatingPercentage: Int
  var intRatingWatching: Int
  var intRatingVotes: Int
  var intRatingLoved: Int
  var intRatingHated: Int
  
  init(jsonData: JSON) {
    self.strId = jsonData["_id"].stringValue
    self.strImdbId = jsonData["imdb_id"].stringValue
    self.strTitle = jsonData["title"].stringValue
    self.strYear = jsonData["year"].stringValue
    self.strSynopsis = jsonData["synopsis"].stringValue
    self.strRunTime = jsonData["runtime"].stringValue
    self.strGenres = jsonData["genres"].stringValue
    self.strImgPoster = jsonData["images"]["poster"].stringValue
    self.strImgFanArt = jsonData["images"]["fanart"].stringValue
    self.strImgBanner = jsonData["images"]["banner"].stringValue
    self.intRatingPercentage = jsonData["percentage"].intValue
    self.intRatingWatching = jsonData["watching"].intValue
    self.intRatingVotes = jsonData["rating"]["votes"].intValue
    self.intRatingLoved = jsonData["rating"]["loved"].intValue
    self.intRatingHated = jsonData["rating"]["hated"].intValue
    
  }
  
}
