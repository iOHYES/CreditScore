//
//  CSDashboardView.swift
//  ClearScore
//
//  Created by Ujjwal on 27/02/2021.
//

import SwiftUI

/// Dashboard view is the rootView for app
struct CSDashboardView: View
{
  var body: some View
  {
    NavigationView
    {
      ///View responsible for showing the credit score details view
      CSDonutView()
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}


