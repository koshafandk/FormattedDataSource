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
  static func labelCellController(text: String? = nil) -> BaseCellController {
    let view = LabelView()
    view.label.text = text
    view.backgroundColor = UIColor.blue
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
  
  static func labelCellController2(text: String? = nil) -> BaseCellController {
    let view = LabelView()
    view.label.text = text
    view.backgroundColor = UIColor.red
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
  
  static func labelCellController3(text: String? = nil) -> BaseCellController {
    let view = LabelView()
    view.label.text = text
    view.backgroundColor = UIColor.brown
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
}
