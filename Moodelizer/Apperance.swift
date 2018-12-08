//
//  Apperance.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit

struct Apperance {
    static func setNavigationBarStyle() {
        let navAppearance = UINavigationBar.appearance()
        let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        navAppearance.barStyle = .black
        navAppearance.barTintColor = UIColor.black
        navAppearance.isTranslucent = false
        navAppearance.tintColor = UIColor.white
        navAppearance.shadowImage = UIImage.imageWithColor(color: UIColor.black)
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font as Any]
    }
}
