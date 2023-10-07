//
//  NSMutableAttributedString+Ext.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(.foregroundColor, value: color, range: range)
        self.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: range)
    }
}
