//
//  ArticleCollectionViewCell.swift
//  ErrorHandling
//
//  Created by TomerBu on 23/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    
}
//1) added a collection view controller to main story board.
//2) subclass UICollection view controller
//3) in the identity inspector choose the subclass
//4) sub class UICollectionViewCell
//5) in the identity inspector choose the subclass
