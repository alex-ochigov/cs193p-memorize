//
//  Array+Only.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/9/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
