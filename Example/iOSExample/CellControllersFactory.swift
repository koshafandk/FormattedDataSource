//
//  CellControllersFactory.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 08.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import FormattedDataSource

class CellControllersFactory {
  private static func labelCellController(text: String? = nil, backgroundColor: UIColor) -> BaseCellController {
    let view = LabelView()
    view.label.text = text
    view.backgroundColor = backgroundColor
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
  
  static func labelCellControllerBlue(text: String? = nil) -> BaseCellController {
    return labelCellController(text: text, backgroundColor: UIColor.blue)
  }
  
  static func labelCellControllerRed(text: String? = nil) -> BaseCellController {
    return labelCellController(text: text, backgroundColor: UIColor.red)
  }
  
  static func labelCellControllerBrown(text: String? = nil) -> BaseCellController {
    return labelCellController(text: text, backgroundColor: UIColor.brown)
  }
  
  static func labelCellControllerGray(text: String? = nil) -> BaseCellController {
    return labelCellController(text: text, backgroundColor: UIColor.gray)
  }
}
