//
//  ContainerCollectionViewCell.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 06.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit

public class ContainerCollectionViewCell: UICollectionViewCell {
  func configure(view: UIView?) {
    guard let view = view else { return }
    contentView.addSubview(view)
    
    contentView.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0))
    let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)
    bottom.priority = UILayoutPriority(rawValue: 999)
    let trailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0)
    trailing.priority = UILayoutPriority(rawValue: 999)
    contentView.addConstraint(bottom)
    contentView.addConstraint(NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0))
    contentView.addConstraint(trailing)
    view.translatesAutoresizingMaskIntoConstraints = false
  }
}
