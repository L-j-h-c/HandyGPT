//
//  DefaultBackground.swift
//  HandyGPT Watch App
//
//  Created by Junho Lee on 2023/05/06.
//

import SwiftUI

struct DefaultBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .padding(.horizontal)
            .background(Color.gray)
    }
}

extension View {
    func applyDefaultBackground() -> some View {
        self.modifier(DefaultBackground())
    }
}
