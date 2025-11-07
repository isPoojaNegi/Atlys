//
//  DestinationCard.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//

import SwiftUI

struct DestinationCard: View {
    let destination: VisaDestination

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("sample2")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))

            VStack(alignment: .leading, spacing: 0) {
                Text(destination.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading,5)
                Text("\(destination.visaCount)K+ Visas on Atlys")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
            }
            .padding(.bottom, 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
