//
//  JsonViewController.swift
//  ErrorHandling
//
//  Created by TomerBu on 16/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class JsonViewController: UITableViewController {
    
    var data: [NewsSource] = []
    
    weak var x:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsDataSource.getData {[weak self](srcArr, err) in
            
            if let err = err {
                print(err)
                return
            }
            
            guard let srcArr = srcArr else {return}
            
            self?.data = srcArr
            self?.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let dest = segue.destination as? ArticleCollectionViewController,
              let sender = sender as? NewsSource else {return}
        
        dest.src = sender
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let src = data[indexPath.row]
        
       performSegue(withIdentifier: "masterToDetail", sender: src)
    }
    
    
}



extension JsonViewController {
    //Data Source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCell") as! NewsTableViewCell
        
        //data binding
        cell.source = data[indexPath.row]
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //delegate
}
