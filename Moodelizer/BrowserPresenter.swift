//
//  BrowserPresenter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - BrowserPresenter Class
final class BrowserPresenter: Presenter {
    
    var feed: ArticlesHeadlines?
    
    override func viewHasLoaded() {
        startContent()
    }
    
    override func viewIsAboutToAppear() {
        view.addObserver()
        view.webViewLoadRequest(url: feed?.url)
    }
    
    override func viewIsAboutToDisappear() {
        view.removeObserver()
    }
    
    override func setupView(data: Any) {
        feed = data as? ArticlesHeadlines
    }
}

// MARK: - BrowserPresenter API
extension BrowserPresenter: BrowserPresenterApi {
    func startContent() {
        view.configWebView()
    }
    
    func buttonClose() {
        router.dismissViewControllerAnimated()
    }
}

// MARK: - Browser Viper Components
private extension BrowserPresenter {
    var view: BrowserViewApi {
        return _view as! BrowserViewApi
    }
    var interactor: BrowserInteractorApi {
        return _interactor as! BrowserInteractorApi
    }
    var router: BrowserRouterApi {
        return _router as! BrowserRouterApi
    }
}
