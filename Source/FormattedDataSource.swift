//
//  FormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public class FormattedSection {
  var format: String?
  var mainDataSourceArray: [CellControllerProtocol]?
  var supportElemets = [Character: CellControllerProtocol]()
}

public class FormattedDataSource: NSObject {
  var formattedSections = [FormattedSection]()
  
  public override init() {
  }
}

// MARK: - UITableViewDataSource
extension FormattedDataSource: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = ContainerTableViewCell()
    return cell
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return formattedSections[section].mainDataSourceArray?.count ?? 0
  }
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return formattedSections.count
  }
}
