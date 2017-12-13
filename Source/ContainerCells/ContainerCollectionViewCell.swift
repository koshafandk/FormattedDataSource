//
//  ContainerCollectionViewCell.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import SnapKit

open class ContainerCollectionViewCell: UICollectionViewCell, ContainerCellProtocol {
  static let identifier = "CollectionContainerCell"
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    contentView.subviews.first?.removeFromSuperview()
  }
  
  open func configure(with view: UIView?) {
    guard let view = view else { return }
    contentView.addSubview(view)
    view.snp.makeConstraints { make in
      make.leading.top.equalToSuperview()
      make.trailing.bottom.equalToSuperview().priority(999)
    }
  }
}
