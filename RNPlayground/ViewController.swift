//
//  ViewController.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Example attributed text
        let attributedString = createAttributedText(
            from: "This is an example of customizable attributed text.",
            highlightRange: NSRange(location: 10, length: 10)
        )
        
        // Selectable TextDisplayView
        let selectableTextView = TextDisplayView(attributedText: attributedString, isSelectable: true)
        selectableTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectableTextView)
        
        // Non-Selectable TextDisplayView
        let nonSelectableTextView = TextDisplayView(attributedText: attributedString, isSelectable: false)
        nonSelectableTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nonSelectableTextView)
        
        // Layout Constraints
        NSLayoutConstraint.activate([
            // Selectable TextDisplayView constraints
            selectableTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            selectableTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectableTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            selectableTextView.heightAnchor.constraint(equalToConstant: 100),
            
            // Non-Selectable TextDisplayView constraints
            nonSelectableTextView.topAnchor.constraint(equalTo: selectableTextView.bottomAnchor, constant: 20),
            nonSelectableTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nonSelectableTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nonSelectableTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // Helper function to create attributed text with a highlighted range
    private func createAttributedText(from text: String, highlightRange: NSRange) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: highlightRange)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: highlightRange)
        return attributedString
    }
}
