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
        guard let url = URL(string: "https://newsapi.org/v1/sources?language=en") else{return}
        
        let session = URLSession.shared // the default session is cached. 

        let task = session.dataTask(with: url) { (data, response, error) in
            //data is binary
            guard let data = data else{return} //binary
            
            //convert the data to json:
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Json else{return}
            
            if let status = json?["status"] as? String{
                print(status)
            }
            
            if let sourcesArray = json?["sources"] as? [Json] {
                //continue parsing...
                
                
                for source in sourcesArray{
                    if let id = source["id"] as? String{
                        print(id)
                    }
                }
            }
        }
        //tasks start as suspended
        
        
        task.resume()
    }
}

typealias Json = Dictionary<String, Any>
