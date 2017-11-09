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
    dataSource.formattedSections[0].mainElements?.removeFirst()
    collectionView.reloadData()
  }
  
  @objc func actionTapOnAddButton() {
    let controller = CellControllersFactory.labelCellControllerBlue(text: "text5")
    dataSource.formattedSections[0].mainElements?.append(controller)
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
    let mainBlueCells = [
      CellControllersFactory.labelCellControllerBlue(text: "text1"),
      CellControllersFactory.labelCellControllerBlue(text: "text2"),
      CellControllersFactory.labelCellControllerBlue(text: "text3"),
      CellControllersFactory.labelCellControllerBlue(text: "text4"),
      CellControllersFactory.labelCellControllerBlue(text: "text5"),
      CellControllersFactory.labelCellControllerBlue(text: "text6"),
      CellControllersFactory.labelCellControllerBlue(text: "text7"),
      CellControllersFactory.labelCellControllerBlue(text: "text8"),
      CellControllersFactory.labelCellControllerBlue(text: "text9")]
    
    let redCells = [
      CellControllersFactory.labelCellControllerRed(text: "text1"),
      CellControllersFactory.labelCellControllerRed(text: "text2"),
      CellControllersFactory.labelCellControllerRed(text: "text3"),
      CellControllersFactory.labelCellControllerRed(text: "text4"),
      CellControllersFactory.labelCellControllerRed(text: "text5"),
      CellControllersFactory.labelCellControllerRed(text: "text6"),
      CellControllersFactory.labelCellControllerRed(text: "text7"),
      CellControllersFactory.labelCellControllerRed(text: "text8"),
      CellControllersFactory.labelCellControllerRed(text: "text9")]
    
    let browmCells = [
      CellControllersFactory.labelCellControllerBrown(text: "text1"),
      CellControllersFactory.labelCellControllerBrown(text: "text2"),
      CellControllersFactory.labelCellControllerBrown(text: "text3"),
      CellControllersFactory.labelCellControllerBrown(text: "text4")
    ]
    
    let mainBlueCells2 = [
      CellControllersFactory.labelCellControllerBlue(text: "text1"),
      CellControllersFactory.labelCellControllerBlue(text: "text2"),
      CellControllersFactory.labelCellControllerBlue(text: "text3"),
      CellControllersFactory.labelCellControllerBlue(text: "text4"),
      CellControllersFactory.labelCellControllerBlue(text: "text5"),
      CellControllersFactory.labelCellControllerBlue(text: "text6"),
      CellControllersFactory.labelCellControllerBlue(text: "text7"),
      CellControllersFactory.labelCellControllerBlue(text: "text8"),
      CellControllersFactory.labelCellControllerBlue(text: "text9")]
    
    formattedSection.format = "*|*|*_"
    formattedSection.mainElements = mainBlueCells
    formattedSection.supportElemets["|"] = redCells
    formattedSection.supportElemets["_"] = browmCells
    formattedSection.lastElement = CellControllersFactory.labelCellControllerGray(text: "text")
    
    let formattedSection2 = FormattedSection()
    formattedSection2.mainElements = mainBlueCells2
    
    dataSource.formattedSections = [formattedSection, formattedSection2]
    
    collectionView.reloadData()
  }
}
