//
//  NewsTableViewCell.swift
//  ErrorHandling
//
//  Created by TomerBu on 19/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit


class NewsTableViewCell: UITableViewCell {
    var source: NewsSource!{
        didSet{
            idLabel?.text = source.id
            excerptLabel?.text = source.excerpt
            nameLabel?.text = source.name
            urlLabel?.text = source.url
        }
    }
    
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var excerptLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
}


//UICollectionView: TableView... Grid. Custom Layout
//Horizontal scroll...
