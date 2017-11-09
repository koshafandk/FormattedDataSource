//
//  CollectionFormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public class CollectionFormattedDataSource: BaseFormattedDataSource, UICollectionViewDataSource {
  // MARK: - UICollectionViewDataSource
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return super.numberOfSections()
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return super.numberOfItemsInSection(section)
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: GlobalConstants.CellIdentifiers.collectionCell,
      for: indexPath)
    guard let containerCell = cell as? ContainerCellProtocol else {
      preconditionFailure("Cell must implement ContainerCellProtocol")
    }
    
    super.configureCell(formattedSections[indexPath.section], containerCell, indexPath)
    return cell
  }
}
