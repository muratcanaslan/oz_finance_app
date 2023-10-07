//
//  UIViewController+Ext.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

extension UIViewController {
    
    func showNativeAlert(haveActionButton: Bool = true, message: String, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        if haveActionButton {
            alert.addAction(.init(title: "Retry", style: .default, handler: actionHandler))
        }
        self.present(alert, animated: true)
    }
}
