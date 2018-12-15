//
//  BrowserModuleApi.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Viperit

//MARK: - BrowserRouter API
protocol BrowserRouterApi: RouterProtocol {
    func dismissViewControllerAnimated()
}

//MARK: - BrowserView API
protocol BrowserViewApi: UserInterfaceProtocol {
    func configWebView()
    func addObserver()
    func removeObserver()
    func webViewLoadRequest(url: String?)
}

//MARK: - BrowserPresenter API
protocol BrowserPresenterApi: PresenterProtocol {
    func buttonClose()
}

//MARK: - BrowserInteractor API
protocol BrowserInteractorApi: InteractorProtocol {
}
