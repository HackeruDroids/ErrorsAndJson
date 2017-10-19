//
//  NewsDataSource.swift
//  ErrorHandling
//
//  Created by TomerBu on 16/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit
//c554ee8ea96747189054b2a3b3f6c9fc
class NewsDataSource {
    static let session = URLSession.shared// URLSession(configuration: ...)
    
    
    static func getData(completionHandler: @escaping ([NewsSource]?, Error?) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v1/sources?language=en") else {return}
       
        
        
        let task = session.dataTask(with: url){ (data: Data?, res, err) in
        //code that runs on a background thread.
            if let err = err{
                completionHandler(nil, err)
                return
            }
            
            guard let data = data else{print("No data check response");return} //we have data. :binary
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            var result = [NewsSource]()
            if let json = json as? JSON{
                if let sourcesArr = json["sources"] as? [JSON]{
                    for src in sourcesArr{
                        guard let id = src["id"] as? String,
                              let name = src["name"] as? String,
                              let description = src["description"] as? String,
                              let url = src["url"] as? String else{return}
                        
                        let src = NewsSource(id: id, excerpt: description, name: name, url: url)
                        result.append(src)
                    }
                    //code that ran in the background
                    //send the result to the ui:
                    DispatchQueue.main.async {
                        //code that runs on the ui Thread.
                        completionHandler(result, nil)
                    }
                    
                }
            }
        }
        task.resume()
    }
}


typealias JSON = [String: Any]
 
