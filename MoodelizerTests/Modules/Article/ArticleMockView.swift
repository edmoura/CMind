//
//  ArticleMockView.swift
//  MoodelizerTests
//
//  Created by Edson iMAC on 15/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
@testable import Moodelizer

class ArticleMockView: UserInterface, ArticleViewApi {
    func setTitle(title: String?) {}
    func setArticlesHeadlines(article: ArticlesHeadlines?) {}
    func configButton() {}
    func configCollectionView() {}
    func reloadCollectionViewData() {}
}
