//
//  CarouselViewModel.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//
import Combine
import SwiftUI

@MainActor
class LandingViewModel: ObservableObject {
    @Published var destinations: [VisaDestination] = []
    @Published var errorMessage: String? = nil
    
    init() {
        loadContent()
    }
    
    func loadContent() {
        errorMessage = nil
        Task { @MainActor in
            // Simulate async loading; replace with real networking if needed.
            self.destinations = [
                VisaDestination(
                    id: "MYS",
                    name: "Malaysia",
                    visaCount: 12, // Displayed as "12K+" in UI
                    imageUrl: "https://example.com/images/kuala_lumpur.jpg"
                ),
                VisaDestination(
                    id: "DXB",
                    name: "Dubai",
                    visaCount: 8,
                    imageUrl: "https://example.com/images/dubai_skyline.jpg"
                ),
                VisaDestination(
                    id: "THD",
                    name: "Thailand",
                    visaCount: 8,
                    imageUrl: "https://example.com/images/thailand_skyline.jpg"
                )
            ]
        }
    }
    
    var trendingBannerData: VisaDestination? {
        destinations.first
    }
}

