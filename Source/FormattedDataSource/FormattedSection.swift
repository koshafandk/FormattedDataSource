//
//  FormattedSection.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 08.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

struct FormattedSectionConstants {
  static let mainSourceSymbol: Character = "*"
}

open class FormattedSection {
  open var format: String?
  open var mainElements: [CellControllerProtocol]?
  open var supportElemets = [Character: [CellControllerProtocol]]()
  open var lastElement: CellControllerProtocol?
  var numberOfItems: Int = 0
  
  public init() {}
  
  func recalculateNumberOfItems() {
    numberOfItems = calculateNumberOfItems()
  }
  
  func calculateNumberOfItems() -> Int {
    guard let format = format else { return mainElements?.count ?? 0 }
    let indexes = format.indexes(of: FormattedSectionConstants.mainSourceSymbol)
    let indexesCount = indexes.count
    var multiplier = 0
    var offset = 0
    
    if let mainArrayCount = mainElements?.count,
      mainArrayCount > 0,
      indexesCount > 0 {
      multiplier = mainArrayCount / indexesCount
      offset = mainArrayCount % indexesCount
    }
    if lastElement != nil {
      offset += 1
    }
    return format.count * multiplier + offset
  }
}
