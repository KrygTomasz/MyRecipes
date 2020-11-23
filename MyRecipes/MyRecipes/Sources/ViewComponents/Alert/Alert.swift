//
//  Alert.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 22/11/2020.
//

import UIKit

class Alert {
    struct TextField {
        var text: String? = nil
        var placeholder: String
    }
    
    struct Button {
        var title: String
        var action: (() -> Void)? = nil
    }
    
    struct HandleInputButton {
        var title: String
        var action: ((String) -> Void)?
    }
    
    let alert: UIAlertController
    
    init(title: String?,
         description: String?,
         textField: TextField?,
         inputAcceptButton: HandleInputButton?,
         acceptButton: Button?,
         cancelButton: Button?,
         color: UIColor?) {
        self.alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        if let textField = textField {
            alert.addTextField { (field) in
                field.placeholder = textField.placeholder
                field.text = textField.text
            }
        }
        if let inputAcceptButton = inputAcceptButton {
            alert.addAction(.init(title: inputAcceptButton.title, style: .cancel, handler: { [weak self] (_) in
                guard let title = self?.alert.textFields?.first?.text, !title.isEmpty else { return }
                inputAcceptButton.action?(title)
            }))
        }
        if let acceptButton = acceptButton {
            alert.addAction(.init(title: acceptButton.title, style: .cancel, handler: { (_) in
                acceptButton.action?()
            }))
        }
        if let cancelButton = cancelButton {
            alert.addAction(.init(title: cancelButton.title, style: .default, handler: { (_) in
                cancelButton.action?()
            }))
        }
        if let color = color { alert.view.tintColor = color }
    }
}
