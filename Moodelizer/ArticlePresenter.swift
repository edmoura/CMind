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
    var articlesHeadlines: ArticlesHeadlines?
    
    override func viewHasLoaded() {
        startContent()
    }
    
    override func setupView(data: Any) {
       articlesHeadlines = data as? ArticlesHeadlines
    }
}

// MARK: - ArticlePresenter API
extension ArticlePresenter: ArticlePresenterApi {
    func startContent() {
        view.setTitle(title: articlesHeadlines?.source?.name)
        view.setArticlesHeadlines(article: articlesHeadlines)
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
