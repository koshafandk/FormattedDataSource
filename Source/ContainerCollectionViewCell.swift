//
//  ContainerCollectionViewCell.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import SnapKit

public class ContainerCollectionViewCell: UICollectionViewCell {
  func configure(view: UIView?) {
    guard let view = view else { return }
    contentView.addSubview(view)
    view.snp.makeConstraints { make in
      make.leading.top.equalToSuperview()
      make.trailing.bottom.equalToSuperview().priority(999)
    }
  }
}
