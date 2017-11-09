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
    return numberOfItems(in: formattedSection)
  }
  
  func numberOfItems(in section: FormattedSection) -> Int {
    guard let format = section.format else { return 0 }
    let indexes = format.indexes(of: FormattedSectionConstants.mainSourceSymbol)
    let indexesCount = indexes.count
    var multiplier = 0
    var offset = 0
    
    if let mainArrayCount = section.mainDataSourceArray?.count,
      mainArrayCount > 0,
      indexesCount > 0 {
      multiplier = mainArrayCount / indexesCount
      offset = mainArrayCount % indexesCount
    }
    return format.count * multiplier + offset
  }
  
  func configureCell(_ section: FormattedSection,
                             _ cell: ContainerCellProtocol,
                             _ indexPath: IndexPath) {
    guard let format = section.format else {
      cell.configure(
        with: section.mainDataSourceArray?[indexPath.row].contentController?.view)
      return
    }
    let formatSymbol = format[format.index(format.startIndex, offsetBy: indexPath.row % format.count)]
    var elementsArray: [CellControllerProtocol]?
    if formatSymbol == FormattedSectionConstants.mainSourceSymbol {
      elementsArray = section.mainDataSourceArray
    } else {
      elementsArray = section.supportElemets[formatSymbol]
    }
    
    let indexes = format.indexes(of: formatSymbol)
    let multiplier = indexPath.row / format.count
    let indexInFormat = indexPath.row % format.count
    
    if let symbolIndexInFormat = indexes.index(of: indexInFormat) {
      let index = indexes.count * multiplier + symbolIndexInFormat
      if let elementsCount = elementsArray?.count, index < elementsCount {
        let contentView = elementsArray?[index].contentController?.view
        cell.configure(with: contentView)
      }
    }
  }
}
