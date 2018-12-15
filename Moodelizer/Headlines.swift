//
//  Headlines.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation

struct Headlines: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticlesHeadlines]?
}

struct ArticlesHeadlines: Codable {
    let source: ArticlesHeadlinesSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct ArticlesHeadlinesSource: Codable {
    let name: String?
}

struct Article:Codable {
    let article: ArticlesHeadlines?
    let fullArticles: [ArticlesHeadlines]?
}
