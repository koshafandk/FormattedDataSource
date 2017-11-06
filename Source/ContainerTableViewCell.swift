//
//  ContainerTableViewCell.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation
import SnapKit

public class ContainerTableViewCell: UITableViewCell {
  func configure(view: UIView?) {
    guard let view = view else { return }
    contentView.addSubview(view)
    view.snp.makeConstraints { make in
      make.leading.top.trailing.equalToSuperview()
      make.bottom.equalToSuperview().priority(999)
    }
  }
}
