//
//  Result.swift
//  Moodelizer
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
