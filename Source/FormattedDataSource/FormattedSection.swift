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
  open var format: String? {
    didSet {
      recalculateNumberOfItems()
    }
  }
  
  open private(set) var mainElements: [CellControllerProtocol]?
  open private(set) var supportElemets = [Character: [CellControllerProtocol]]()
  open private(set) var lastElement: CellControllerProtocol?
  open private(set) var numberOfItems: Int = 0
  
  public init() {}
  
  @discardableResult
  open func insert(mainElements: [CellControllerProtocol]? = nil,
                   supportElements: [Character: [CellControllerProtocol]]? = nil) -> [Int] {
    let prevLastIndex = (lastElement != nil ? numberOfItems - 1 : numberOfItems)
    
    if let mainElements = mainElements {
      if let oldMainElements = self.mainElements,
        !oldMainElements.isEmpty {
        self.mainElements?.append(contentsOf: mainElements)
      } else {
        self.mainElements = mainElements
      }
    }

    supportElements?.forEach {
      if self.supportElemets.keys.contains($0.key) {
        self.supportElemets[$0.key]?.append(contentsOf: $0.value)
      } else {
        self.supportElemets[$0.key] = $0.value
      }
    }
    recalculateNumberOfItems()
    let newLastIndex = (lastElement != nil ? numberOfItems - 1 : numberOfItems)
    return (prevLastIndex..<newLastIndex).flatMap { $0 }
  }
  
  open func remove(at mainIndexes: [Int],
                   supportIndexes: [Character: [Int]] = [:]) {
    
    mainIndexes.filter { $0 < (mainElements?.count ?? 0) }.sorted(by: >).forEach { mainElements?.remove(at: $0) }
    
    supportIndexes.forEach { element in
      let elementIndexes = element.value.filter { $0 < (supportElemets[element.key]?.count ?? 0) }.sorted(by: >)
      elementIndexes.forEach { supportElemets[element.key]?.remove(at: $0) }
    }
    recalculateNumberOfItems()
  }
  
  open func setLastElement(_ lastElement: CellControllerProtocol?) {
    self.lastElement = lastElement
    recalculateNumberOfItems()
  }
  
  open func recalculateNumberOfItems() {
    numberOfItems = calculateNumberOfItems()
  }
  
  open func calculateNumberOfItems() -> Int {
    guard let format = format else { return mainElements?.count ?? 0 }
    let mainIndexes = format.indexes(of: FormattedSectionConstants.mainSourceSymbol)
    let indexesCount = mainIndexes.count
    var mainSetsCount = 0
    let mainElementsCount = mainElements?.count ?? 0
    var supportElementsCount = 0
    
    var lastMainIndex = 0
    
    if mainElementsCount > 0,
      indexesCount > 0 {
      mainSetsCount = mainElementsCount / indexesCount
      let offset = mainElementsCount % indexesCount
      if offset > 0 {
        lastMainIndex = mainSetsCount * format.count + mainIndexes[offset - 1]
      } else {
        mainSetsCount -= 1
        lastMainIndex = mainSetsCount * format.count + (mainIndexes.last ?? 0)
      }
    }
    
    supportElemets.forEach { supportElement in
      let indexes = format.indexes(of: supportElement.key)
      let indexesCount = indexes.count
      if indexesCount == 0 { return }
      
      let multiplier = supportElement.value.count / indexesCount
      var supportIndexes = indexes.reduce([], { (result, index) -> [Int] in
        return result + (0..<multiplier).flatMap { $0 * format.count + index }
      })
      let lastOffset = supportElement.value.count % indexesCount
      if lastOffset > 0 {
        let fullIndex = multiplier * format.count
        indexes.prefix(through: lastOffset - 1).forEach { supportIndexes.append(fullIndex + $0) }
      }
      supportElementsCount += supportIndexes.filter { $0 < lastMainIndex }.count
    }
    
    if lastElement != nil {
      supportElementsCount += 1
    }
    return mainElementsCount + supportElementsCount
  }
}
