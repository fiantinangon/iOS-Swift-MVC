//
//  AFApiClient.swift
//  Research-UnitTest
//
//  Created by Alfian on 9/22/16.
//  Copyright © 2016 Alfian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias resultHendler = (JSON?,Error?)

class AFApiClient: NSObject {
  
  // This method hendle your request using Alamofire
  // you can use other networking framework also
  
  func request(httpMethod: Alamofire.HTTPMethod , urlString: String, requestHendler: @escaping (resultHendler) -> Void) {
    var requestResult: (jsonData: JSON?, error: Error?)
    
    
    Alamofire.request(urlString).responseJSON { response in
      print(response.request)  // original URL request
      print(response.response) // ®HTTP URL response
      print(response.data)     // server data
      print(response.result)   // result of response serialization
      
      switch response.result {
      case .success:
        if let data = response.result.value {
          requestResult.jsonData = JSON(data)
          requestHendler(requestResult)
          requestHendler(requestResult)
        }
      case .failure(let _error):
        requestResult.error = _error
        requestHendler(requestResult)
      }
    }
    
  }

}
