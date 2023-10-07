//
//  CryptoDetailViewModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import Foundation

protocol CrypyoDetailViewModelInterface: AnyObject {
    var view: CryptoDetailInterface? { get set }

    var cellVM: CryptoTableCellViewModel { get }
    
    func viewDidLoad()
}

final class CryptoDetailViewModel {
    
    weak var view: CryptoDetailInterface?
    let cellVM: CryptoTableCellViewModel
    
    init(cellVM: CryptoTableCellViewModel) {
        self.cellVM = cellVM
    }
}

extension CryptoDetailViewModel: CrypyoDetailViewModelInterface {
    
    func viewDidLoad() {
        view?.setNavigationTitle(with: cellVM.shortName, with: cellVM.longName)
        view?.setupHeaderView()
    }
}
