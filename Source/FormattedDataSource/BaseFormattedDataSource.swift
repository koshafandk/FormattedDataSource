//
//  BaseFormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 08.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public class BaseFormattedDataSource: NSObject {
  public var formattedSections = [FormattedSection]()
  
  public override init() {}
  
  func numberOfSections() -> Int {
    return formattedSections.count
  }
  
  func numberOfItemsInSection(_ section: Int) -> Int {
    let formattedSection = formattedSections[section]
    formattedSection.recalculateNumberOfItems()
    return formattedSection.numberOfItems
  }
  
  func configureCell(_ section: FormattedSection,
                     _ cell: ContainerCellProtocol,
                     _ indexPath: IndexPath) {
    guard let format = section.format else {
      cell.configure(
        with: section.mainElements?[indexPath.row].contentController?.view)
      return
    }
    if let lastElement = section.lastElement, indexPath.row == section.numberOfItems - 1 {
      cell.configure(with: lastElement.contentController?.view)
      return
    }
    let formatSymbol = format[format.index(format.startIndex, offsetBy: indexPath.row % format.count)]
    var elementsArray = getElementsArray(symbol: formatSymbol, section: section)
    
    let indexes = format.indexes(of: formatSymbol)
    let multiplier = indexPath.row / format.count
    let indexInFormat = indexPath.row % format.count
    
    if let symbolOffset = indexes.index(of: indexInFormat) {
      let index = indexes.count * multiplier + symbolOffset
      if let elementsCount = elementsArray?.count, index < elementsCount {
        let contentView = elementsArray?[index].contentController?.view
        cell.configure(with: contentView)
      }
    }
  }
  
  func getElementsArray(symbol: Character, section: FormattedSection) -> [CellControllerProtocol]? {
    if symbol == FormattedSectionConstants.mainSourceSymbol {
      return section.mainElements
    } else {
      return section.supportElemets[symbol]
    }
  }
}
