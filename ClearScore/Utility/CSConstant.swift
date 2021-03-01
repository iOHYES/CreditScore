//
//  Constant.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation
import SwiftUI

struct CSConstants {
  
  // MARK: Error Messages
  let kInvalidURLError  = "Invalid URL"
  let kInvalidPostData  = "Invalid post data"
  let KEmptyData        = "There is no data"
  
  
  // MARK: Color Constant
  let kGradient = RadialGradient(
    gradient   : Gradient(colors: [.yellow, .orange]),
    center     : UnitPoint(x: 0.25, y: 0.25),
    startRadius: 0.8,
    endRadius  : 500
  )
}
