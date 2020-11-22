//
//  AlertBuilder.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 22/11/2020.
//

import UIKit

final class AlertBuilder {
    private var title: String?
    private var description: String?
    private var textField: Alert.TextField?
    private var inputAcceptButton: Alert.HandleInputButton?
    private var acceptButton: Alert.Button?
    private var cancelButton: Alert.Button?
    private var color: UIColor?
    
    func set(title value: String) -> AlertBuilder {
        self.title = value
        return self
    }
    
    func set(description value: String) -> AlertBuilder {
        self.description = value
        return self
    }
    
    func addTextField(_ value: Alert.TextField) -> AlertBuilder {
        self.textField = value
        return self
    }
    
    func addTextAcceptButton(_ button: Alert.HandleInputButton) -> AlertBuilder {
        self.inputAcceptButton = button
        return self
    }
    
    func addAcceptButton(_ button: Alert.Button) -> AlertBuilder {
        self.acceptButton = button
        return self
    }
    
    func addCancelButton(_ button: Alert.Button) -> AlertBuilder {
        self.cancelButton = button
        return self
    }
    
    func set(color value: UIColor) -> AlertBuilder {
        self.color = value
        return self
    }
    
    func build() -> Alert {
        return Alert(title: title,
                     description: description,
                     textField: textField,
                     inputAcceptButton: inputAcceptButton,
                     acceptButton: acceptButton,
                     cancelButton: cancelButton,
                     color: color)
    }
}
