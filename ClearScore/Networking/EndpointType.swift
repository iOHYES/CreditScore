//
//  EndpointType.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Protocol to implement for url creation
protocol EndpointType
{
  var baseURL: URL { get }
  var path: String { get }
}
