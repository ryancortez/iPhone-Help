//
//  JSONHandler.swift
//  iPhone Help
//
//  Created by Ryan Cortez on 6/15/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import Foundation


// A class designed to easily abstract away the reading and writing of JSON from a server
class JSONHandler : NSObject {
    
    // Pull JSON from a server
    func jsonFromURL(url: String) {
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    self.parseJSON(json)
                    
                }catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        task.resume()
    }
    
    // Takes JSON and breaks it into collections
    func parseJSON (json: AnyObject) {
        if let stations = json["Help"] as? [[String: AnyObject]] {
            for station in stations {
                if let name = station["title"] as? String {
                    if let year = station["article"] as? String {
                        print(name,year)
                    }
                    if let video = station["video"] as? String {
                        print(video)
                    }
                }
            }
        }
    }

}