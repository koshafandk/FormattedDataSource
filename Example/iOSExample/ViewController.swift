//
//  ViewController.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import FormattedDataSource

class LabelView: UIView {
  let label: UILabel
  
  init(label: UILabel) {
    self.label = label
    
    super.init(frame: CGRect.zero)
    
    addSubview(label)
    addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
    label.translatesAutoresizingMaskIntoConstraints = false
    
    
    label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
    label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
    label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
    label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class ViewController: UIViewController {
  let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
  let ds = FormattedDataSource(format: "aba")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 44.0
    
    var a = [BaseCellController]()
    var b = [BaseCellController]()
    
    let l1 = UILabel()
    let l2 = UILabel()
    let l3 = UILabel()
    
    let a1 = BaseCellController()
    let v1 = LabelView(label: l1)
    v1.label.text = "l1"
    a1.view = v1
    
    let a2 = BaseCellController()
    let v2 = LabelView(label: l2)
    v2.label.text = "l2"
    a2.view = v2
    a.append(a1)
    a.append(a2)
    
    let v3 = LabelView(label: l3)
    
    ds.dataSourceDict.append(a)
    ds.dataSourceDict.append(b)
//    ds.dataSourceDict["a"] = a
//    ds.dataSourceDict["b"] = b
    view.addSubview(tableView)
    
    tableView.dataSource = ds
    tableView.reloadData()
  }
}
