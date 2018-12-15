//
//  IndexPresenter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit

// MARK: - IndexPresenter Class
final class IndexPresenter: Presenter {
    
    private var articles = [ArticlesHeadlines]()
    private var pageSize = 10
    private var page = 1
    private var isLoadingArticles = false
    private var isLoadedAllArticles = false
    private var tasks = [URLSessionTask]()
    private var imageTask = [UIImage]()
    
    override func viewHasLoaded() {
        startContent()
    }
}

// MARK: - IndexPresenter API
extension IndexPresenter: IndexPresenterApi {
    
    func startContent() {
        view.setTitle()
        view.setTableView()
        view.setLoadingContent()
        getArticles(pageSize: pageSize, page: page)
    }
    
    private func getArticles(country:String = "us", pageSize: Int, page: Int, apiKey: String = "a878d9cab50c46e2a2854adab5de1277") {
        interactor.getArticle(country: country, pageSize: pageSize, page: page, apiKey: apiKey) { (result) in
            switch result {
            case .success(let data):
                if data.articles?.isEmpty == false {
                    for art in data.articles ?? [] {
                        self.articles.append(art)
                    }
                    self.view.reloadTableViewData()
                    self.view.hideLoadingMoreArticles()
                    self.view.hideLoadingIndex()
                    self.isLoadingArticles = false
                } else {
                    self.view.hideLoadingMoreArticles()
                    self.isLoadedAllArticles = true
                }
            case .failure(let error):
                print("error: \(error)")
                self.view.hideLoadingMoreArticles()
                self.isLoadedAllArticles = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ArticleTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? ArticleTableViewCell
        
        if cell == nil {
            cell = ArticleTableViewCell(style:.default, reuseIdentifier: "newsCell")
        }
        
        let article = self.articles[exist: indexPath.row]
        cell?.update(article: article)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,  heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > 1 {
            if isLoadedAllArticles == false {
                if indexPath.row == (articles.count - 1) && !isLoadingArticles {
                    isLoadingArticles = true
                    page += 1
                    getArticles(pageSize: pageSize, page: page)
                    view.showLoadingMoreArticles()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = self.articles[exist: indexPath.row] {
            let article = Article(article: article, fullArticles: self.articles)
            router.showArticlesDetails(data: article)
        }
    }

    func getTotalNews() -> Int {
        return articles.count
    }
}

// MARK: - Index Viper Components
private extension IndexPresenter {
    var view: IndexViewApi {
        return _view as! IndexViewApi
    }
    var interactor: IndexInteractorApi {
        return _interactor as! IndexInteractorApi
    }
    var router: IndexRouterApi {
        return _router as! IndexRouterApi
    }
}
