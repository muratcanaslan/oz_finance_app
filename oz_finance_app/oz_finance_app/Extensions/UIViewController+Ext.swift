//
//  UIViewController+Ext.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

extension UIViewController {
    
    func showEmptyAlert(message: String, actionHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        alert.addAction(.init(title: "Retry", style: .default, handler: actionHandler))
        self.present(alert, animated: true)
    }
}
