//
//  CellControllerProtocol.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public protocol CellControllerProtocol {
  var contentController: ContentControllerProtocol? { get set }
  func didSelect()
}
