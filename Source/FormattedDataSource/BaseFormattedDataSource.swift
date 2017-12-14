//
//  BaseFormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 08.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

open class BaseFormattedDataSource: NSObject {
  open var formattedSections = [FormattedSection]()
  
  public override init() {}
  
  open func numberOfSections() -> Int {
    return formattedSections.count
  }
  
  open func numberOfItemsInSection(_ section: Int) -> Int {
    return formattedSections[section].numberOfItems
  }
  
  open func configureCell(_ section: FormattedSection,
                          _ cell: ContainerCellProtocol,
                          _ indexPath: IndexPath) {
    if let lastElement = section.lastElement, indexPath.row == section.numberOfItems - 1 {
      cell.configure(with: lastElement.contentController?.view)
      return
    }
    let cellController = getElement(for: indexPath)
    cell.configure(with: cellController?.contentController?.view)
  }
  
  open func getElement(for indexPath: IndexPath) -> CellControllerProtocol? {
    let section = formattedSections[indexPath.section]
    guard let format = section.format else { return section.mainElements?[indexPath.row] }
    let formatSymbol = format[format.index(format.startIndex, offsetBy: indexPath.row % format.count)]
    var elementsArray = getElementsArray(symbol: formatSymbol, section: section)
    
    let indexes = format.indexes(of: formatSymbol)
    let multiplier = indexPath.row / format.count
    let indexInFormat = indexPath.row % format.count
    
    if let symbolOffset = indexes.index(of: indexInFormat) {
      let index = indexes.count * multiplier + symbolOffset
      if let elementsCount = elementsArray?.count, index < elementsCount {
        return elementsArray?[index]
      }
    }
    return nil
  }
  
  open func insert(mainElements: [CellControllerProtocol],
                   supportElements: [Character: [CellControllerProtocol]],
                   toSection section: Int) -> [IndexPath] {
    let newIndexes = formattedSections[section].insert(mainElements: mainElements, supportElements:supportElements)
    return newIndexes.flatMap { IndexPath(row: $0, section: section) }
  }
  
  open func remove(at mainIndexes: [Int],
                     supportIndexes: [Character: [Int]] = [:],
                     fromSection section: Int) {
    formattedSections[section].remove(at: mainIndexes, supportIndexes:supportIndexes)
  }
  
  open func setLastElement(_ lastElement: CellControllerProtocol?,
                           forSection section: Int) {
    formattedSections[section].setLastElement(lastElement)
  }
  
  public func getElementsArray(symbol: Character, section: FormattedSection) -> [CellControllerProtocol]? {
    if symbol == FormattedSectionConstants.mainSourceSymbol {
      return section.mainElements
    } else {
      return section.supportElemets[symbol]
    }
  }
}

