//
//  ArticleCollectionViewCell.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit

protocol  ArticleCollectionProtocol {
    func update(article: ArticlesHeadlines?)
}

class ArticleCollectionViewCell: UICollectionViewCell, ArticleCollectionProtocol{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    func update(article: ArticlesHeadlines?) {
        
        title.text = article?.source?.name?.components(separatedBy: ".").first
        image.sd_setImage(with: URL(string: article?.urlToImage ?? "")) { (image, error, cacheType, imageUrl) in
            if error != nil {
                self.image.image = UIImage(named: "empty")
            } else {
                self.image.image = image
                UIView.animate(withDuration: 0.5, animations: {
                    self.image.alpha = 1
                })
            }
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }
    
}
