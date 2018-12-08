//
//  IndexInteractor.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit
import Moya

// MARK: - IndexInteractor Class
final class IndexInteractor: Interactor {
    let articleService = MoyaProvider<ArticleService>()
    //let articleService = MoyaProvider<ArticleService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    var request: Cancellable?
}

// MARK: - IndexInteractor API
extension IndexInteractor: IndexInteractorApi {
    func getArticle(country: String, pageSize: Int, page: Int, apiKey: String, callback: @escaping (Result<Headlines>) -> Void) {
        request = articleService.request(.getArticle(country: country, pageSize: pageSize, page: page, apiKey: apiKey), completion: { (result) in
            switch result {
            case let .success(moyaResponse):
                if let headLines: Headlines = try? JSONDecoder().decode(Headlines.self, from: moyaResponse.data) {
                    callback(.success(headLines))
                } else {
                    callback(.failure(AppErrorHandler.jsonNotSerializable))
                }
            case let .failure(error):
                callback(.failure(error))
            }
        })
    }
    
    func cancelRequest() {
        request?.cancel()
    }
}

// MARK: - Interactor Viper Components Api
private extension IndexInteractor {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
}
