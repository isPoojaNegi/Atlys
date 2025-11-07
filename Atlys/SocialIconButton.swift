//
//  SocialIconButton.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//
import SwiftUI

struct SocialIconButton: View {
    let image: Image
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)

                )
        }
        .buttonStyle(.plain)
    }
}
