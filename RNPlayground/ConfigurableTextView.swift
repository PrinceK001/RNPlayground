//
//  ConfigurableTextView.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import UIKit

class ConfigurableTextView: UITextView {
    
    // Initializer that takes a `isSelectable` parameter
    init(isSelectable: Bool, text: String) {
        super.init(frame: .zero, textContainer: nil)
        
        self.isSelectable = isSelectable   // Set selectable based on parameter
        self.isEditable = false            // Disable editing
        self.font = UIFont.systemFont(ofSize: 16)
        self.text = text                   // Set the provided text
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
