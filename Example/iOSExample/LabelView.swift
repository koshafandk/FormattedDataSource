//
//  LabelView.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import SnapKit

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
    label.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    label.textColor = UIColor.white
    label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
    label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
    label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
    label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
  }
}
