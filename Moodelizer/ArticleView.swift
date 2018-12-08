//
//  ArticleView.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit

//MARK: ArticleView Class
final class ArticleView: UserInterface {
    @IBOutlet weak var urlToImage: UIImageView!
    @IBOutlet weak var _title: UILabel!
    @IBOutlet weak var _description: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
}

//MARK: - ArticleView API
extension ArticleView: ArticleViewApi {
    func setTitle(title: String?) {
        self.title = title
    }
    
    func setArticlesHeadlines(article: ArticlesHeadlines?) {
        let published = Date.fromString(article?.publishedAt ?? "")
        urlToImage.alpha = 0
        _title.text = article?.title
        _description.text = article?.description
        author.text = article?.author
        publishedAt.text = published.dayMonthAndWeekDay.capitalized
        urlToImage.sd_setImage(with: URL(string: article?.urlToImage ?? "")) { (image, error, cacheType, imageUrl) in
            if image != nil {
                self.urlToImage.image = image
                UIView.animate(withDuration: 0.5, animations: {
                    self.urlToImage.alpha = 1
                })
            }
        }
    }
}

// MARK: - ArticleView Viper Components API
private extension ArticleView {
    var presenter: ArticlePresenterApi {
        return _presenter as! ArticlePresenterApi
    }
    var displayData: ArticleDisplayData {
        return _displayData as! ArticleDisplayData
    }
}
