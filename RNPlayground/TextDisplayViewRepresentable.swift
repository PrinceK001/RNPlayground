//
//  TextDisplayViewRepresentable.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import SwiftUI
import UIKit

struct TextDisplayViewRepresentable: UIViewRepresentable {
    var attributedText: NSAttributedString
    var isSelectable: Bool

    func makeUIView(context: Context) -> TextDisplayView {
        let view = TextDisplayView(attributedText: attributedText, isSelectable: isSelectable)
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: TextDisplayView, context: Context) {
        uiView.attributedText = attributedText
        uiView.isSelectable = isSelectable
    }
}
