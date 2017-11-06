//
//  FormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public class FormattedSection {
  public var format: String?
  public var mainDataSourceArray: [CellControllerProtocol]?
  public var supportElemets = [Character: SupportCellControllerProtocol]()
  
  public init() {}
}

public class FormattedDataSource: NSObject {
  public var formattedSections = [FormattedSection]()
  
  public override init() {}
}

// MARK: - UICollectionViewDataSource
extension FormattedDataSource: UICollectionViewDataSource {
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return formattedSections.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return formattedSections[section].mainDataSourceArray?.count ?? 0
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! ContainerCollectionViewCell
    let contentView = formattedSections[indexPath.section].mainDataSourceArray?[indexPath.row].contentController?.view
    cell.configure(view: contentView)
    return cell
  }
}
