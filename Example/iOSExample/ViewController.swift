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
  
  let removeButton = UIButton(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 40, width: 100, height: 40))
  let addButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 40, width: 100, height: 40))

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    let collectionViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 40)
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
    removeButton.addTarget(self, action: #selector(actionTapOnButton), for: .touchUpInside)
    removeButton.setTitle("Remove", for: .normal)
    removeButton.backgroundColor = UIColor.red
    view.addSubview(removeButton)
    
    addButton.addTarget(self, action: #selector(actionTapOnAddButton), for: .touchUpInside)
    addButton.setTitle("Add", for: .normal)
    addButton.backgroundColor = UIColor.green
    view.addSubview(addButton)
  }
  
  @objc func actionTapOnButton() {
    dataSource.formattedSections[0].mainDataSourceArray?.removeFirst()
    collectionView.deleteItems(at: [IndexPath(row: 0, section: 0)])
  }
  
  @objc func actionTapOnAddButton() {
    let controller = CellControllersFactory.labelCellController(text: "text5")
    dataSource.formattedSections[0].mainDataSourceArray?.append(controller)
    collectionView.insertItems(at: [IndexPath(row: (dataSource.formattedSections[0].mainDataSourceArray?.count)! - 1, section: 0)])
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
    collectionView.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    collectionLayout.estimatedItemSize = CGSize(width: 100, height: 100)
    view.addSubview(collectionView)
    collectionView.backgroundColor = UIColor.white
    collectionView.dataSource = dataSource
    collectionView.alwaysBounceVertical = true
  }
  
  func setupDataSource() {
    let formattedSection = FormattedSection()
    formattedSection.mainDataSourceArray = [
      CellControllersFactory.labelCellController(text: "text1"),
      CellControllersFactory.labelCellController(text: "text2"),
      CellControllersFactory.labelCellController(text: "text3"),
      CellControllersFactory.labelCellController(text: "text4"),
      CellControllersFactory.labelCellController(text: "text5")]
    
    formattedSection.format = "*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|"
    let dividerFactory = DividerControllerFactory()
    formattedSection.supportElemets["|"] = dividerFactory
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
  
  static func dividerCellController() -> BaseCellController {
    let view = UIView()
    view.backgroundColor = UIColor.darkText
    let controller = BaseCellController()
    controller.contentController = ContentController(view: view)
    return controller
  }
}

class DividerControllerFactory: CellControllerFactoryProtocol {
  func cellController() -> CellControllerProtocol {
    return CellControllersFactory.dividerCellController()
  }
}
