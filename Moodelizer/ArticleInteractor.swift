//
//  ArticleInteractor.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ArticleInteractor Class
final class ArticleInteractor: Interactor {
}

// MARK: - ArticleInteractor API
extension ArticleInteractor: ArticleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension ArticleInteractor {
    var presenter: ArticlePresenterApi {
        return _presenter as! ArticlePresenterApi
    }
}
