//
//  AtlysApp.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//

import SwiftUI

@main
struct AtlysApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = LandingViewModel()
            LandingView(viewModel: viewModel)
        }
    }
}
