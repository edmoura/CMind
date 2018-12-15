//
//  BrowserTests.swift
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

class BrowserTests: QuickSpec {
    override func spec() {
        var view: BrowserMockView?
        var presenter: BrowserPresenter?
        
        beforeEach {
            var mod = AppModules.Browser.build()
            view = BrowserMockView()
            presenter = mod.presenter as? BrowserPresenter
            mod.injectMock(view: view!)
        }
        
        describe("BrowserTests") {
            context("AppModules"){
                it("check module build correct components") {
                    expect(presenter?._view).toEventually(beAnInstanceOf(BrowserMockView.self))
                    expect(presenter).toEventually(beAnInstanceOf(BrowserPresenter.self))
                    expect(presenter?._interactor).toEventually(beAnInstanceOf(BrowserInteractor.self))
                    expect(presenter?._router).toEventually(beAnInstanceOf(BrowserRouter.self))
                }
            }
        }
        
        describe("BrowserPresenter") {
            context("when BrowserPresenter is initialized") {
                beforeEach {
                    presenter?.viewHasLoaded()
                    presenter?.viewIsAboutToAppear()
                    presenter?.viewIsAboutToDisappear()
                }
                it("verify default var values"){
                    expect(presenter?.feed).to(beNil())
                }
            }
        }
        
    }
}
