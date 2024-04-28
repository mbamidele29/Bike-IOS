//
//  BackButtonView.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        IconButtonView(icon: Assets.back) {
            mode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    BackButtonView()
}
