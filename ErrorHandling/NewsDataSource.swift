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
    
    static func getData(){
        guard let url = URL(string: "https://newsapi.org/v1/sources?language=en") else {return}
        let session = URLSession.shared// URLSession(configuration: ...)
        
        let task = session.dataTask(with: url){ (data: Data?, res, err) in
            if let err = err{
                print(err)
                //test the response for debuging aid
                return
            }
            
            guard let data = data else{print("No data check response");return}
            //we have data. :binary
            let json = try? JSONSerialization.jsonObject(with: data, options: [])

            if let json = json as? JSON{
                if let sourcesArr = json["sources"] as? [JSON]{
                    for src in sourcesArr{
                        guard let id = src["id"] as? String,
                              let name = src["name"] as? String,
                              let description = src["description"] as? String,
                              let url = src["url"] as? String else{return}
                        
                        let src = NewsSource(id: id, excerpt: description, name: name, url: url)
                    }
                }
            }
        }
        task.resume()
    }
}


typealias JSON = [String: Any]
 
