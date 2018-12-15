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
    func configButton()
    func configCollectionView()
    func reloadCollectionViewData()
}

//MARK: - ArticlePresenter API
protocol ArticlePresenterApi: PresenterProtocol {
    func buttonVisit()
    func getTotalArticles() -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

//MARK: - ArticleInteractor API
protocol ArticleInteractorApi: InteractorProtocol {
}
