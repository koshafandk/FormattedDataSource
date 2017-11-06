//
//  LabelView.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit

class LabelView: UIView {
  let label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension LabelView {
  func setupLayout() {
    setupLabel()
  }
  
  func setupLabel() {
    addSubview(label)
    label.frame = CGRect(x: 5, y: 5, width: 200, height: 20)
  }
}
