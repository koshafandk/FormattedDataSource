//
//  String+Extension.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public extension String {
  public func character(at position: Int) -> Character {
    let charIndex = index(startIndex, offsetBy: position)
    return self[charIndex]
  }
  
  public func indexes(of char: Character) -> [Int] {
    var charIndexes = [Int]()
    for i in 0..<count {
      if character(at: i) == char {
        charIndexes.append(i)
      }
    }
    return charIndexes
  }
}
