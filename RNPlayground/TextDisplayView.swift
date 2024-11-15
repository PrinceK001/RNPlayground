//
//  TextDisplayView.swift
//  RNPlayground
//
//  Created by Prince Tripathi on 14/11/24.
//

import UIKit

class TextDisplayView: UIView {
    
    // MARK: - Properties
    
    var attributedText: NSAttributedString? {
        didSet {
            setNeedsDisplay() // Redraw the view when text is updated
        }
    }
    
    var isSelectable: Bool = false {
        didSet {
            configureContextMenu()
        }
    }
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer?
    private var editMenuInteraction: UIEditMenuInteraction?
    
    // MARK: - Initializers
    
    init(attributedText: NSAttributedString, isSelectable: Bool = false) {
        self.attributedText = attributedText
        self.isSelectable = isSelectable
        super.init(frame: .zero)
        
        configureContextMenu()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContextMenu()
    }
    
    // MARK: - Context Menu Configuration
    
    private func configureContextMenu() {
        if isSelectable {
            enableContextMenu()
        } else {
            disableContextMenu()
        }
    }
    
    private func enableContextMenu() {
        // Remove any existing gesture recognizers or interactions
        disableContextMenu()
        
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        if let longPressGestureRecognizer = longPressGestureRecognizer {
            addGestureRecognizer(longPressGestureRecognizer)
        }
        
        if #available(iOS 16.0, *) {
            editMenuInteraction = UIEditMenuInteraction(delegate: self)
            if let editMenuInteraction = editMenuInteraction {
                addInteraction(editMenuInteraction)
            }
        }
    }
    
    private func disableContextMenu() {
        if let longPressGestureRecognizer = longPressGestureRecognizer {
            removeGestureRecognizer(longPressGestureRecognizer)
            self.longPressGestureRecognizer = nil
        }
        
        if let editMenuInteraction = editMenuInteraction {
            removeInteraction(editMenuInteraction)
            self.editMenuInteraction = nil
        }
    }
    
    // MARK: - Long Press Gesture Handling
    
    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard isSelectable, gesture.state == .began else { return }
        
        if #available(iOS 16.0, *) {
            let location = gesture.location(in: self)
            let config = UIEditMenuConfiguration(identifier: nil, sourcePoint: location)
            editMenuInteraction?.presentEditMenu(with: config)
        } else {
            becomeFirstResponder()
            let menuController = UIMenuController.shared
            menuController.setTargetRect(bounds, in: self)
            menuController.setMenuVisible(true, animated: true)
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return isSelectable
    }
    
    // MARK: - Custom Drawing
    
    override func draw(_ rect: CGRect) {
        guard let attributedText = attributedText else { return }
        attributedText.draw(in: rect.insetBy(dx: 10, dy: 10))
    }
}

// MARK: - UIEditMenuInteractionDelegate for iOS 16+

@available(iOS 16.0, *)
extension TextDisplayView: UIEditMenuInteractionDelegate {
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, configurationForMenuAtLocation location: CGPoint, defaultMenu: UIMenu) -> UIEditMenuConfiguration? {
        return UIEditMenuConfiguration(identifier: nil, sourcePoint: location)
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration, suggestedActions: [UIMenuElement]) -> UIMenu? {
        let copyAction = UIAction(title: "Copy", image: nil) { _ in
            UIPasteboard.general.string = self.attributedText?.string
        }
        return UIMenu(children: [copyAction])
    }
}
