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
  let dataSource = CollectionFormattedDataSource()
  
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
    
    removeButton.addTarget(self, action: #selector(actionTapOnRemoveButton), for: .touchUpInside)
    removeButton.setTitle("Remove", for: .normal)
    removeButton.backgroundColor = UIColor.red
    view.addSubview(removeButton)
    
    addButton.addTarget(self, action: #selector(actionTapOnAddButton), for: .touchUpInside)
    addButton.setTitle("Add", for: .normal)
    addButton.backgroundColor = UIColor.green
    view.addSubview(addButton)
  }
  
  @objc func actionTapOnRemoveButton() {
    dataSource.formattedSections[0].mainDataSourceArray?.removeFirst()
    collectionView.reloadData()
  }
  
  @objc func actionTapOnAddButton() {
    let controller = CellControllersFactory.labelCellController(text: "text5")
    dataSource.formattedSections[0].mainDataSourceArray?.append(controller)
    collectionView.reloadData()
  }
}

// MARK: - Init configure
private extension ViewController {
  func initConfigure() {
    configureCollectionView()
    setupDataSource()
  }
  
  func configureCollectionView() {
    collectionView.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionContainerCell")
    
    collectionLayout.estimatedItemSize = CGSize(width: 50, height: 50)
    view.addSubview(collectionView)
    collectionView.backgroundColor = UIColor.white
    collectionView.dataSource = dataSource
    collectionView.alwaysBounceVertical = true
  }
  
  func setupDataSource() {
    let formattedSection = FormattedSection()
    var mainArray = [
      CellControllersFactory.labelCellController(text: "text1"),
      CellControllersFactory.labelCellController(text: "text2"),
      CellControllersFactory.labelCellController(text: "text3"),
      CellControllersFactory.labelCellController(text: "text4"),
      CellControllersFactory.labelCellController(text: "text5"),
      CellControllersFactory.labelCellController(text: "text6"),
      CellControllersFactory.labelCellController(text: "text7"),
      CellControllersFactory.labelCellController(text: "text8"),
      CellControllersFactory.labelCellController(text: "text9")]
    
    let dividers = [
      CellControllersFactory.labelCellController2(text: "text1"),
      CellControllersFactory.labelCellController2(text: "text2"),
      CellControllersFactory.labelCellController2(text: "text3"),
      CellControllersFactory.labelCellController2(text: "text4"),
      CellControllersFactory.labelCellController2(text: "text5"),
      CellControllersFactory.labelCellController2(text: "text6"),
      CellControllersFactory.labelCellController2(text: "text7"),
      CellControllersFactory.labelCellController2(text: "text8"),
      CellControllersFactory.labelCellController2(text: "text9")]
    
    let bottomDividers = [
      CellControllersFactory.labelCellController3(text: "text1"),
      CellControllersFactory.labelCellController3(text: "text2"),
      CellControllersFactory.labelCellController3(text: "text3"),
      CellControllersFactory.labelCellController3(text: "text4")
    ]
    
    formattedSection.format = "*|*|*_"
    formattedSection.mainDataSourceArray = mainArray
    formattedSection.supportElemets["|"] = dividers
    formattedSection.supportElemets["_"] = bottomDividers
    dataSource.formattedSections = [formattedSection]
    
    collectionView.reloadData()
  }
}
