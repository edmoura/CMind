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
    var article: ArticlesHeadlines?
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
        self.article = feed?.article
        view.configButton()
        view.configCollectionView()
        reloadContent(name: name ?? "")
    }
    
    func reloadContent(name: String) {
        collectionFeed = feed?.fullArticles?.filter({ $0.source?.name != name })
        view.reloadCollectionViewData()
        view.setTitle(title: name.components(separatedBy: ".").first)
        view.setArticlesHeadlines(article: self.article)
    }
    
    func buttonVisit() {
        router.showWebView(article: self.article)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let article = collectionFeed?[exist: indexPath.row] {
            let name = article.source?.name
            self.article = article
            reloadContent(name: name ?? "")
        }
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
