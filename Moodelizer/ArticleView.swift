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
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var btVisit: UIButton!
    @IBAction func buttonVisit(_ sender: Any) {
        presenter.buttonVisit()
    }
    @IBOutlet weak var collectionView: UICollectionView!
}

//MARK: - ArticleView API
extension ArticleView: ArticleViewApi {
    func setTitle(title: String?) {
        self.title = title
    }
    
    func configButton() {
        btVisit.layer.cornerRadius = 10
    }
    
    func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func reloadCollectionViewData() {
        collectionView.reloadData()
    }
    
    func setArticlesHeadlines(article: ArticlesHeadlines?) {
        let published = Date.fromString(article?.publishedAt ?? "")
        urlToImage.alpha = 0
        _title.text = article?.title
        _description.text = article?.description
        author.text = article?.author
        publishedAt.text = published.dayMonthAndWeekDay.capitalized
        urlToImage.sd_setImage(with: URL(string: article?.urlToImage ?? "")) { (image, error, cacheType, imageUrl) in
            if error != nil {
                self.urlToImage.image = UIImage(named: "empty")
            } else {
                self.urlToImage.image = image
                UIView.animate(withDuration: 0.5, animations: {
                    self.urlToImage.alpha = 1
                })
            }
        }
    }
}

extension ArticleView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getTotalArticles()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter.collectionView(collectionView, cellForItemAt: indexPath)
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
