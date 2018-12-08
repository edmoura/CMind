//
//  ArticleService.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Moya

enum ArticleService {
    case getArticle(country: String, pageSize: Int, page: Int, apiKey: String)
}

extension ArticleService: TargetType {
    var baseURL: URL {
        switch self {
        case .getArticle(_):
            return URL(string: "https://newsapi.org/v2")!
        }
    }
    
    var path: String {
        switch self {
        case .getArticle(_):
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArticle(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getArticle(let country, let pageSize, let page, let apiKey):
            return .requestParameters(parameters: ["country": country, "pageSize": pageSize, "page": page, "apiKey": apiKey, "category":"technology"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer"]
    }
}
