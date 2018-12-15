//
//  BrowserMockView.swift
//  MoodelizerTests
//
//  Created by Edson iMAC on 15/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
@testable import Moodelizer

class BrowserMockView: UserInterface, BrowserViewApi {
    func configWebView() {}
    func addObserver() {}
    func removeObserver() {}
    func webViewLoadRequest(url: String?) {}
}

