//
//  BaseViews.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit
import Reusable

class BaseView: UIView, NibOwnerLoadable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
        applyStyling()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        applyStyling()
    }
    
    func applyStyling() { }
}

class BaseTableViewCell: UITableViewCell, NibReusable { }
