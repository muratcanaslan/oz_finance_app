//
//  ChartListViewController.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

protocol ChartListInterface: AnyObject {
    
    func prepareTableView()
    func reloadData()
}

final class ChartListViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    private let viewModel: ChartListViewModel
    
    //MARK: - Init
    init(viewModel: ChartListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ChartListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

//MARK: - ChartListInterface
extension ChartListViewController: ChartListInterface {
    func prepareTableView() {
        tableView.register(cellType: ChartTableCell.self)
        tableView.contentInset = .init(top: 48, left: 0, bottom: 48, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension ChartListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ChartTableCell.self)
        cell.configure(with: viewModel.cellForItem(indexPath: indexPath))
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ChartListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "**It contains last \(viewModel.cellVMs.count) prices."
    }
}
