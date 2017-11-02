//
//  FormattedDataSource.swift
//  FormattedDataSource
//
//  Created by BRANDERSTUDIO on 02.11.2017.
//  Copyright © 2017 BRANDERSTUDIO. All rights reserved.
//

import Foundation

public class FormattedDataSource: NSObject {
  public var dataSourceDict = [[CellControllerProtocol]]()
  let format: String
  
  public init(format: String) {
    self.format = format
  }
}

// MARK: - UITableViewDataSource
extension FormattedDataSource: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cellView = dataSourceDict[indexPath.section][indexPath.row].view
//
//    let cell: ContainerTableViewCell<classType> = dequeContainerCell(tableView)
//    cell.textLabel?.text = String(indexPath.row)
    
    let cell = ContainerTableViewCell()
    cell.configure(view: dataSourceDict[indexPath.section][indexPath.row].view)
    return cell
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSourceDict.count
  }
}
