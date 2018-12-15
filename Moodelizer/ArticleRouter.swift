//
//  ArticleRouter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ArticleRouter class
final class ArticleRouter: Router {
    func showWebView(article: ArticlesHeadlines?) {
        let module = AppModules.Browser.build()
        module.router.show(from: _view, embedInNavController: true, setupData: article)
    }
}

// MARK: - ArticleRouter API
extension ArticleRouter: ArticleRouterApi {
}

// MARK: - Article Viper Components
private extension ArticleRouter {
    var presenter: ArticlePresenterApi {
        return _presenter as! ArticlePresenterApi
    }
}
