//
//  ArticleTests.swift
//  MoodelizerTests
//
//  Created by Edson iMAC on 15/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Viperit
@testable import Moodelizer

class ArticleTests: QuickSpec {
    override func spec() {
        var view: ArticleMockView?
        var presenter: ArticlePresenter?
        
        beforeEach {
            var mod = AppModules.Article.build()
            view = ArticleMockView()
            presenter = mod.presenter as? ArticlePresenter
            mod.injectMock(view: view!)
        }
        
        describe("ArticleTests") {
            context("AppModules"){
                it("check module build correct components") {
                    expect(presenter?._view).toEventually(beAnInstanceOf(ArticleMockView.self))
                    expect(presenter).toEventually(beAnInstanceOf(ArticlePresenter.self))
                    expect(presenter?._interactor).toEventually(beAnInstanceOf(ArticleInteractor.self))
                    expect(presenter?._router).toEventually(beAnInstanceOf(ArticleRouter.self))
                }
            }
        }
        
        describe("ArticlePresenter") {
            context("when ArticlePresenter is initialized") {
                beforeEach {
                    presenter?.viewHasLoaded()
                    presenter?.reloadContent(name: "")
                    presenter?.buttonVisit()
                }
                it("verify default var values"){
                    expect(presenter?.feed).to(beNil())
                    expect(presenter?.article).to(beNil())
                    expect(presenter?.collectionFeed).to(beNil())
                    expect(presenter?.getTotalArticles()) >= 0
                }
            }
        }
    }
}
