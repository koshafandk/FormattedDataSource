//
//  String+Extension.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

extension String {
  func character(at position: Int) -> Character {
    let charIndex = index(startIndex, offsetBy: position)
    return self[charIndex]
  }
}
