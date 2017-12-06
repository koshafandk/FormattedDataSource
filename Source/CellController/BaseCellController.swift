//
//  BaseCellController.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

open class BaseCellController: CellControllerProtocol {
  open var contentController: ContentControllerProtocol?
  
  public init() {
  }
  
  open func didSelect() {
  }
}
