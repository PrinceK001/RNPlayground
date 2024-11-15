//
//  ContentView.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 13/11/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // SwiftUI Text (Selectable)
                Text("SwiftUI Text (Selectable)")
                    .font(.headline)
                Text("This is a selectable SwiftUI Text view.")
                    .textSelection(.enabled)
                    .padding()
                    .border(Color.gray, width: 1)
                
                // SwiftUI Text (Non-Selectable)
                Text("SwiftUI Text (Non-Selectable)")
                    .font(.headline)
                Text("This is a non-selectable SwiftUI Text view.")
                    .padding()
                    .border(Color.gray, width: 1)
                
                // UIView with NSAttributedString (Selectable)
                Text("UIView with NSAttributedString (Selectable)")
                    .font(.headline)
                AttributedTextUIViewRepresentable(
                    attributedText: createAttributedText(
                        from: "Selectable This is a customizable attributed text example.",
                        highlightRange: NSRange(location: 10, length: 9)
                    ),
                    isSelectable: true
                )
                .frame(height: 100)
                .border(Color.gray, width: 1)
                
                // UIView with NSAttributedString (Non-Selectable)
                Text("UIView with NSAttributedString (Non-Selectable)")
                    .font(.headline)
                AttributedTextUIViewRepresentable(
                    attributedText: createAttributedText(
                        from: "Non-Selectable this is a customizable attributed text example.",
                        highlightRange: NSRange(location: 10, length: 9)
                    ),
                    isSelectable: false
                )
                .frame(height: 100)
                .border(Color.gray, width: 1)
                
                // UIKit Selectable UITextView
                Text("UIKit - UITextView (Selectable)")
                    .font(.headline)
                SelectableTextViewRepresentable()
                    .frame(height: 100)
                    .border(Color.gray, width: 1)
                
                // UIKit Non-Selectable UITextView
                Text("UIKit - UITextView (Non-Selectable)")
                    .font(.headline)
                NonSelectableTextViewRepresentable()
                    .frame(height: 100)
                    .border(Color.gray, width: 1)
                
                // UIKit TextDisplayView (Selectable)
                Text("UIKit - TextDisplayView (Selectable)")
                    .font(.headline)
                TextDisplayViewRepresentable(
                    attributedText: createAttributedText(
                        from: "This is a customizable attributed text example in selectable mode.",
                        highlightRange: NSRange(location: 10, length: 9)
                    ),
                    isSelectable: true
                )
                .frame(height: 100)
                .border(Color.gray, width: 1)
                
                // UIKit TextDisplayView (Non-Selectable)
                Text("UIKit - TextDisplayView (Non-Selectable)")
                    .font(.headline)
                TextDisplayViewRepresentable(
                    attributedText: createAttributedText(
                        from: "This is a customizable attributed text example in non-selectable mode.",
                        highlightRange: NSRange(location: 10, length: 9)
                    ),
                    isSelectable: false
                )
                .frame(height: 100)
                .border(Color.gray, width: 1)
                
                Spacer()
            }
            .padding()
        }
    }
    
    // Helper function to create attributed text with a highlighted range
    func createAttributedText(from text: String, highlightRange: NSRange) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: highlightRange)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: highlightRange)
        return attributedString
    }
}

#Preview {
    ContentView()
}
