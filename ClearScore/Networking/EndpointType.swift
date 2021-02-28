//
//  EndpointType.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
