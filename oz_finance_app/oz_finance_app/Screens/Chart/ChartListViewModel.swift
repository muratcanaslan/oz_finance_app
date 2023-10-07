//
//  ChartListViewModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import Foundation

protocol ChartListViewModelInterface: AnyObject {
    var view: ChartListInterface? { get set }
    var cellVMs: [ChartTableCellViewModel] { get }
    
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func cellForItem(indexPath: IndexPath) -> ChartTableCellViewModel
}

final class ChartListViewModel {
    
    weak var view: ChartListInterface?
    
    var cellVMs: [ChartTableCellViewModel]
    
    init(model: [ChartTableCellViewModel]) {
        self.cellVMs = model
    }
}

extension ChartListViewModel: ChartListViewModelInterface {
    func numberOfRowsInSection() -> Int {
        return cellVMs.count
    }
    
    func cellForItem(indexPath: IndexPath) -> ChartTableCellViewModel {
        return cellVMs[indexPath.row]
    }
    
    func viewDidLoad() {
        view?.prepareTableView()
        view?.reloadData()
    }
}
