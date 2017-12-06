//
//  ContentController.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 03.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

open class ContentController: ContentControllerProtocol {
  open var view: UIView?
  
  public init(view: UIView? = nil) {
    self.view = view
  }
}
