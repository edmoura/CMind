//
//  ArticleModuleApi.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Viperit

//MARK: - ArticleRouter API
protocol ArticleRouterApi: RouterProtocol {
}

//MARK: - ArticleView API
protocol ArticleViewApi: UserInterfaceProtocol {
    func setTitle(title: String?)
    func setArticlesHeadlines(article: ArticlesHeadlines?)
}

//MARK: - ArticlePresenter API
protocol ArticlePresenterApi: PresenterProtocol {
}

//MARK: - ArticleInteractor API
protocol ArticleInteractorApi: InteractorProtocol {
}
