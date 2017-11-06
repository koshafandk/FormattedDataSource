//
//  ViewController.swift
//  iOSExample
//
//  Created by BRANDERSTUDIO on 03.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import UIKit
import FormattedDataSource

class ViewController: UIViewController {
  let collectionLayout = UICollectionViewFlowLayout()
  var collectionView: UICollectionView
  let dataSource = FormattedDataSource()

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    let collectionViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    collectionView = UICollectionView(frame: collectionViewRect, collectionViewLayout: collectionLayout)
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    let collectionViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    collectionView = UICollectionView(frame: collectionViewRect, collectionViewLayout: collectionLayout)
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initConfigure()
  }
}
//
//extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return CGSize(width: 100, height: 100)
//  }
//}

// MARK: - Init configure
private extension ViewController {
  func initConfigure() {
    configureCollectionView()
    setupDataSource()
  }
  
  func configureCollectionView() {
    //collectionLayout.itemSize = CGSize(width: 100, height: 100)
    collectionView.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    collectionLayout.estimatedItemSize = CGSize(width: 100, height: 100)
    view.addSubview(collectionView)
    collectionView.backgroundColor = UIColor.white
    collectionView.dataSource = dataSource
    //collectionView.delegate = self
  }
  
  func setupDataSource() {
    let formattedSection = FormattedSection()
    formattedSection.mainDataSourceArray = [
      CellControllersFactory.labelCellController(text: "text1"),
      CellControllersFactory.labelCellController(text: "text2"),
      CellControllersFactory.labelCellController(text: "text3")]
    
    formattedSection.format = "*|*|*"
    formattedSection.supportElemets["|"] = CellControllersFactory.dividerCellController()
    dataSource.formattedSections.append(formattedSection)
    collectionView.reloadData()
  }
}

class CellControllersFactory {
  static func labelCellController(text: String? = nil) -> BaseCellController {
    let view = LabelView()
    view.label.text = text
    view.backgroundColor = UIColor.blue
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
  
  static func dividerCellController() -> BaseSupportCellController {
    let view = UIView()
    view.backgroundColor = UIColor.darkText
    let controller = BaseSupportCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
}
