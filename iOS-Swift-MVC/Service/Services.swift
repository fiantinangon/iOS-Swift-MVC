//
//  Services.swift
//  Research-UnitTest
//
//  Created by Alfian on 9/23/16.
//  Copyright © 2016 Alfian. All rights reserved.
//

import Alamofire
import SwiftyJSON

import Foundation

typealias callBackError = (Error) -> Void

class Services {
  //MARK: ATTRIBUTES
  
  static let apiClient = AFApiClient()
  
  //MARK: GET -
  
  //MARK: Movie List
  
  typealias callBackMovieData = ([MovieData]) -> Void
  static func getMovieList(intpage: Int? = nil, onSuccess: callBackMovieData? = nil, onError: callBackError? = nil){
    
    var urlString = "\(URLS.BASE_URL)\(URLS.API_MOVIE_PROVIDER)"
    
    if let _intPage = intpage {
      urlString = "\(urlString)\(_intPage)"
    }
    
    self.apiClient.request(httpMethod: .get, urlString: urlString) { (result) in
      let (jsonData,error) = result
      
      var arrMovieData = [MovieData]()
      
      
      if let _jsonData = jsonData {
        for data in _jsonData.arrayValue {
          arrMovieData.append(MovieData(jsonData: data))
        }
        onSuccess?(arrMovieData)
      }else {
        onError?(error!)
      }
    }
    
  }
  
  //MARK: TV Show List
  
  
  //MARK: - POST
}
