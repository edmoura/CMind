//
//  ArticlePresenter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ArticlePresenter Class
final class ArticlePresenter: Presenter {
    
    var feed: Article?
    var collectionFeed: [ArticlesHeadlines]?
    
    override func viewHasLoaded() {
        startContent()
    }
    
    override func setupView(data: Any) {
       feed = data as? Article
    }
}

// MARK: - ArticlePresenter API
extension ArticlePresenter: ArticlePresenterApi {
    func startContent() {
        let name = feed?.article?.source?.name
        collectionFeed = feed?.fullArticles?.filter({ $0.source?.name != name })
        view.setTitle(title: name)
        view.setArticlesHeadlines(article: feed?.article)
        view.configButton()
        view.configCollectionView()
        view.reloadCollectionViewData()
    }
    
    func buttonVisit() {
        
    }
    
    func getTotalArticles() -> Int {
        return collectionFeed?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? ArticleCollectionViewCell
        cell?.image.layer.cornerRadius = 20
        cell?.image.clipsToBounds = true
        if let _article = collectionFeed?[exist: indexPath.row] {
            cell?.update(article: _article)
        }
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Article Viper Components
private extension ArticlePresenter {
    var view: ArticleViewApi {
        return _view as! ArticleViewApi
    }
    var interactor: ArticleInteractorApi {
        return _interactor as! ArticleInteractorApi
    }
    var router: ArticleRouterApi {
        return _router as! ArticleRouterApi
    }
}
