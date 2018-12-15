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
    func showWebView(article: ArticlesHeadlines?)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

//MARK: - ArticleInteractor API
protocol ArticleInteractorApi: InteractorProtocol {
}
