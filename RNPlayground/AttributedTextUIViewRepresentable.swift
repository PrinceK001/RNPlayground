//
//  AttributedTextUIViewRepresentable.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import SwiftUI
import UIKit

struct AttributedTextUIViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    
    var attributedText: NSAttributedString
    var isSelectable: Bool

    // MARK: - UIViewRepresentable Methods
    
    func makeUIView(context: Context) -> AttributedTextUIView {
        let view = AttributedTextUIView()
        view.backgroundColor = .clear
        view.isSelectable = isSelectable // Configure selectable property
        view.attributedText = attributedText // Set attributed text
        return view
    }

    func updateUIView(_ uiView: AttributedTextUIView, context: Context) {
        uiView.attributedText = attributedText
        uiView.isSelectable = isSelectable
    }
}

