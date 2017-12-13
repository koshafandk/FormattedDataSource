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
    let formattedSection = formattedSections[section]
    formattedSection.recalculateNumberOfItems()
    return formattedSection.numberOfItems
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
  
  func getElementsArray(symbol: Character, section: FormattedSection) -> [CellControllerProtocol]? {
    if symbol == FormattedSectionConstants.mainSourceSymbol {
      return section.mainElements
    } else {
      return section.supportElemets[symbol]
    }
  }
}

