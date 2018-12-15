//
//  IndexMockView.swift
//  MoodelizerTests
//
//  Created by Edson iMAC on 15/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
@testable import Moodelizer

class IndexMockView: UserInterface, IndexViewApi {
    func setTitle() {}
    func setTableView() {}
    func setLoadingContent() {}
    func reloadTableViewData() {}
    func showLoadingMoreArticles() {}
    func hideLoadingMoreArticles() {}
    func hideLoadingIndex() {}
    func getTableView() -> UITableView {
        return UITableView()
    }
}
