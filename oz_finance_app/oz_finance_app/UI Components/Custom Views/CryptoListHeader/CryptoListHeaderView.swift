//
//  CryptoListHeaderView.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

protocol CryptoListHeaderViewDelegate: AnyObject {
    func didTapSort()
}

final class CryptoListHeaderView: BaseView {

    //MARK: - IBOutlets
    @IBOutlet private weak var sortButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: CryptoListHeaderViewDelegate?
    
    //MARK: - Base Methods
    override func applyStyling() {
        super.applyStyling()
    }

    //MARK: - IBActions
    @IBAction private func didTapSort(_ sender: UIButton) {
        self.delegate?.didTapSort()
    }
    
    //MARK: - UI Helpers
    func updateSortTitle(with title: String) {
        self.sortButton.setTitle(title, for: .normal)
    }
}
