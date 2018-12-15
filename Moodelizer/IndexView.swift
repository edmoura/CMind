//
//  IndexView.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit

//MARK: IndexView Class
final class IndexView: UserInterface {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingContent: UIView!
    @IBOutlet weak var indexLoading: UIView!
}

//MARK: - IndexView API
extension IndexView: IndexViewApi {
    func setTitle() {
        let size: CGFloat = 18
        let navLabel = UILabel()
        navLabel.numberOfLines = 2
        navLabel.textAlignment = .center
        navLabel.textColor = .white
        let _title = "C/MIND"
        let _subTitle = "News"
        let title = "\(_title) \(_subTitle)"
        let navTitle = NSMutableAttributedString(string: title)
        navTitle.setFontForText(_title, with:UIFont.systemFont(ofSize: size, weight: .black))
        navTitle.setFontForText(_subTitle, with:UIFont.systemFont(ofSize: size, weight: .ultraLight))
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    
    func setLoadingContent() {
        self.loadingContent.layer.cornerRadius = 20
        self.loadingContent.transform = CGAffineTransform(translationX: 0, y: 100)
    }
    
    func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func reloadTableViewData() {
        self.tableView.reloadData()
    }
    
    func showLoadingMoreArticles() {
        let animations = {
            self.loadingContent.transform = CGAffineTransform.identity
        }
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity:0.5, options: .curveEaseInOut, animations: animations, completion: nil)
    }
    
    func hideLoadingMoreArticles() {
        let animations = {
            self.loadingContent.transform = CGAffineTransform(translationX: 0, y: 100)
        }
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity:0.5, options: .curveEaseInOut, animations: animations, completion: nil)
    }
    
    func hideLoadingIndex() {
        if self.indexLoading != nil {
            UIView.animate(withDuration: 0.5, animations: {
                self.indexLoading.alpha = 0
            }) { (success) in
                self.indexLoading.removeFromSuperview()
            }
        }
    }
    
    func getTableView() -> UITableView {
        return self.tableView
    }
}

extension IndexView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getTotalNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return presenter.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return presenter.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
}

// MARK: - IndexView Viper Components API
private extension IndexView {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
    var displayData: IndexDisplayData {
        return _displayData as! IndexDisplayData
    }
}
