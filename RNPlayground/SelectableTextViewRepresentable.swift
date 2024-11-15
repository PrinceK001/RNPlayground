//
//  SelectableTextViewRepresentable.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import SwiftUI
import UIKit

struct SelectableTextViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ConfigurableTextView {
        return ConfigurableTextView(isSelectable: true, text: "This is a selectable UITextView. You can select and copy this text.")
    }

    func updateUIView(_ uiView: ConfigurableTextView, context: Context) {
        // No updates needed as the text is static
    }
}
