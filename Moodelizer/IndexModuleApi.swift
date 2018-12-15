//
//  IndexModuleApi.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Viperit

//MARK: - IndexRouter API
protocol IndexRouterApi: RouterProtocol {
    func showArticlesDetails(data: Article?)
}

//MARK: - IndexView API
protocol IndexViewApi: UserInterfaceProtocol {
    func setTitle()
    func setTableView()
    func setLoadingContent()
    func reloadTableViewData()
    func showLoadingMoreArticles()
    func hideLoadingMoreArticles()
    func hideLoadingIndex()
    func getTableView() -> UITableView
}

//MARK: - IndexPresenter API
protocol IndexPresenterApi: PresenterProtocol {
    func getTotalNews() -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

//MARK: - IndexInteractor API
protocol IndexInteractorApi: InteractorProtocol {
    func getArticle(country: String, pageSize: Int, page: Int, apiKey: String, callback: @escaping(Result<Headlines>) -> Void)
    func cancelRequest()
}
