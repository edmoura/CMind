//
//  ArticleTableViewCell.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import SDWebImage

protocol ArticleTableProtocol {
    func update(article: ArticlesHeadlines?)
}

class ArticleTableViewCell: UITableViewCell, ArticleTableProtocol {
    
    @IBOutlet weak var urlToImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var _description: UILabel!
    @IBOutlet weak var contentImg: UIView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        urlToImage.layer.cornerRadius = 30
        urlToImage.alpha = 0
        urlToImage.layer.borderColor =  UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        urlToImage.layer.borderWidth = 1.5
        contentImg.layer.cornerRadius = urlToImage.layer.cornerRadius
        contentImg.dropShadow(color: UIColor.black, opacity: 0.3, offSet: CGSize(width: 3, height: 5), radius: 15, scale: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(article: ArticlesHeadlines?) {
        name.text = article?.source?.name
        _description.text = article?.description
        urlToImage.sd_setImage(with: URL(string: article?.urlToImage ?? "")) { (image, error, cacheType, imageUrl) in
            if image != nil {
                self.urlToImage.image = image
                UIView.animate(withDuration: 0.5, animations: {
                    self.urlToImage.alpha = 1
                })
            }
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }
}
