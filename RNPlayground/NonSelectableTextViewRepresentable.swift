//
//  NonSelectableTextViewRepresentable.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import SwiftUI
import UIKit

struct NonSelectableTextViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ConfigurableTextView {
        return ConfigurableTextView(isSelectable: false, text: "This is a non-selectable UITextView. You cannot select or copy this text.")
    }

    func updateUIView(_ uiView: ConfigurableTextView, context: Context) {
        // No updates needed as the text is static
    }
}
