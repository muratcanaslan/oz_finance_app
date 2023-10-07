//
//  CryptoListViewController.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import UIKit

protocol CryptoListInterface: AnyObject {
    func prepareTableView()
    func setNavigationTitle()
    func setupUI()
    func fetchList()
    func reloadData()
    func showAlert(with message: String)
    func routeDetail(with model: CryptoTableCellViewModel)
    func openActionSheet()
    func updateSortTitle(with title: String)
}

final class CryptoListViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    private let viewModel = CryptoListViewModel()
    private let tableHeaderView = CryptoListHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 96))
    
    //MARK: - Lifecycle Methos
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        tableHeaderView.delegate = self
        viewModel.viewDidLoad()
    }
    
}

//MARK: - CryptoListInterface
extension CryptoListViewController: CryptoListInterface {
    func updateSortTitle(with title: String) {
        self.tableHeaderView.updateSortTitle(with: title)
    }
    
    func openActionSheet() {
        let defaultSort = UIAlertAction(title: CryptoSortType.default.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .default)
        }
        
        let priceSort = UIAlertAction(title: CryptoSortType.price.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .price)
        }
        
        let marketCapSort = UIAlertAction(title: CryptoSortType.marketCap.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .marketCap)
        }
        
        let volume24hSort = UIAlertAction(title: CryptoSortType.volume24h.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .volume24h)
        }
        
        let listedAtSort = UIAlertAction(title: CryptoSortType.listedAt.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .listedAt)
        }
        
        let changeSort = UIAlertAction(title: CryptoSortType.change.title, style: .default) { [weak self] _ in
            self?.viewModel.updateSortType(with: .change)
        }
        
        let actSheet = UIAlertController(title: "Change sort type", message: nil, preferredStyle: .actionSheet)
        actSheet.addAction(defaultSort)
        actSheet.addAction(priceSort)
        actSheet.addAction(marketCapSort)
        actSheet.addAction(volume24hSort)
        actSheet.addAction(listedAtSort)
        actSheet.addAction(changeSort)
        actSheet.addAction(.init(title: "Cancel", style: .cancel))
        present(actSheet, animated: true)
    }
    
    func showAlert(with message: String) {
        self.showEmptyAlert(message: message, actionHandler: { [weak self] _ in
            self?.viewModel.fetchList()
        })
    }
    
    func routeDetail(with model: CryptoTableCellViewModel) {
        // TODO: - Router Detail
    }
    
    func fetchList() {
        viewModel.fetchList()
    }
    
    func setNavigationTitle() {
        navigationItem.title = "Crypto List"
    }
    
    func setupUI() {
        view.backgroundColor = .systemGray6
    }
    
    func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = tableHeaderView
        tableView.register(cellType: CryptoTableCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension CryptoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CryptoTableCell.self)
        cell.configure(with: viewModel.cellForItem(indexPath: indexPath))
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CryptoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}

extension CryptoListViewController: CryptoListHeaderViewDelegate {
    func didTapSort() {
        viewModel.didTapSort()
    }
}
