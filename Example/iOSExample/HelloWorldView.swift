//
//  HelloWorldView.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit

class HelloWorldView: UIView {
  let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)
    label.text = "Hello world"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
