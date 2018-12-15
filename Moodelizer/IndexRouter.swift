//
//  IndexRouter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - IndexRouter class
final class IndexRouter: Router {
}

// MARK: - IndexRouter API
extension IndexRouter: IndexRouterApi {
    func showArticlesDetails(data: Article?) {
        let module = AppModules.Article.build()
        module.router.show(from: _view, embedInNavController: false, setupData: data)
    }
}

// MARK: - Index Viper Components
private extension IndexRouter {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
}
