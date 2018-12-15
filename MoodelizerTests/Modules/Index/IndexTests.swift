//
//  IndexTests.swift
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

class IndexTests: QuickSpec {
    override func spec() {
        
        var view: IndexMockView?
        var presenter: IndexPresenter?
        
        beforeEach {
            var mod = AppModules.Index.build()
            view = IndexMockView()
            presenter = mod.presenter as? IndexPresenter
            mod.injectMock(view: view!)
        }
        
        describe("IndexTests") {
            context("AppModules"){
                it("check module build correct components") {
                    expect(presenter?._view).toEventually(beAnInstanceOf(IndexMockView.self))
                    expect(presenter).toEventually(beAnInstanceOf(IndexPresenter.self))
                    expect(presenter?._interactor).toEventually(beAnInstanceOf(IndexInteractor.self))
                    expect(presenter?._router).toEventually(beAnInstanceOf(IndexRouter.self))
                }
            }
        }
        
        describe("IndexPresenter") {
            context("when IndexPresenter is initialized") {
                beforeEach {
                    presenter?.viewHasLoaded()
                }
                it("verify default var values"){
                    expect(presenter?.page).to(beAKindOf(Int.self))
                    expect(presenter?.pageSize).to(beAKindOf(Int.self))
                    expect(presenter?.page).to(equal(1))
                    expect(presenter?.pageSize).to(equal(10))
                    expect(presenter?.isLoadingArticles).to(beFalse())
                    expect(presenter?.isLoadedAllArticles).to(beFalse())
                    expect(presenter?.articles).to(haveCount(0))
                    expect(presenter?.getTotalNews()) >= 0
                }
            }
        }
    }
}
