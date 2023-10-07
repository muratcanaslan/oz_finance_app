//
//  CryptoListViewModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import Foundation

protocol CrypyoListViewModelInterface: AnyObject {
    var view: CryptoListInterface? { get set }
    
    var selectedSortType: CryptoSortType { get }
    var cellVMs: [CryptoTableCellViewModel] { get }
    var sortedCellVMs: [CryptoTableCellViewModel] { get }
    
    func viewDidLoad()
    
    func fetchList()
    
    func numberOfRowsInSection() -> Int
    func cellForItem(indexPath: IndexPath) -> CryptoTableCellViewModel
    func didSelectItemAt(indexPath: IndexPath)
    
    func didTapSort()
    
    func updateSortType(with type: CryptoSortType)
    
    func filterVMs()
}

final class CryptoListViewModel {

    weak var view: CryptoListInterface?
    var selectedSortType: CryptoSortType = .default
    var cellVMs = [CryptoTableCellViewModel]()
    var sortedCellVMs = [CryptoTableCellViewModel]()
    
    func filterVMs() {
        switch selectedSortType {
        case .default:
            self.sortedCellVMs = cellVMs
        case .price:
            self.sortedCellVMs = cellVMs.sorted(by: { $0.sortablePrice > $1.sortablePrice})
        case .marketCap:
            self.sortedCellVMs = cellVMs.sorted(by: { $0.sortableMarketCap > $1.sortableMarketCap})
        case .volume24h:
            self.sortedCellVMs = cellVMs.sorted(by: { $0.sortable24HVolume > $1.sortable24HVolume})
        case .change:
            self.sortedCellVMs = cellVMs.sorted(by: { $0.sortableChange > $1.sortableChange})
        case .listedAt:
            self.sortedCellVMs = cellVMs.sorted(by: { $0.sortableListedAt > $1.sortableListedAt})
        }
        
        view?.reloadData()
    }
}

//MARK: - CrypyoListViewModelInterface
extension CryptoListViewModel: CrypyoListViewModelInterface {
    func updateSortType(with type: CryptoSortType) {
        if type == selectedSortType { return }
        
        selectedSortType = type
        view?.updateSortTitle(with: selectedSortType.title)
        filterVMs()
    }
    
    func didTapSort() {
        view?.openActionSheet()
    }
    
    func viewDidLoad() {
        view?.prepareTableView()
        view?.setupUI()
        view?.setNavigationTitle()
        view?.fetchList()
        
    }
    
    func numberOfRowsInSection() -> Int {
        return sortedCellVMs.count
    }
    
    func cellForItem(indexPath: IndexPath) -> CryptoTableCellViewModel {
        return sortedCellVMs[indexPath.row]
    }
    
    func fetchList() {
        Services.getList { [weak self] result in
            switch result {
            case .success(let response):
                if let coins = response.data?.coins, !coins.isEmpty {
                    self?.cellVMs = coins.map({ .init(model: $0 )})
                    self?.sortedCellVMs = coins.map({ .init(model: $0 )})
                    self?.view?.reloadData()
                } else {
                    self?.view?.showAlert(with: "Not found cryptos.")
                }
                
            case .failure(let error):
                self?.view?.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        view?.routeDetail(with: cellVMs[indexPath.row])
    }
    
}
