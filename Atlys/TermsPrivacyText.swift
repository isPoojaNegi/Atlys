//
//  TermsPrivacyText.swift
//  Atlys
//
//  Created by Pooja on 07/11/25.
//
import SwiftUI

struct TermsPrivacyText: View {
    var body: some View {
        (
            Text("By continuing, you agree to our ")
                .foregroundColor(.secondary)
            + Text("terms")
                .underline()
                .foregroundColor(.primary)
            + Text(" & ")
                .foregroundColor(.secondary)
            + Text("privacy")
                .underline()
                .foregroundColor(.primary)
            + Text(" policy.")
                .foregroundColor(.secondary)
        )
        .font(.footnote)
        .multilineTextAlignment(.center)
    }
}
