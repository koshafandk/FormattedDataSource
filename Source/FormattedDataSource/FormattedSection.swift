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

public class FormattedSection {
  public var format: String?
  public var mainDataSourceArray: [CellControllerProtocol]?
  public var supportElemets = [Character: [CellControllerProtocol]]()
  
  public init() {}
}
