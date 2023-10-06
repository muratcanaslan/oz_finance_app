//
//  CryptoListViewController.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import UIKit

final class CryptoListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var cellVMs = [CryptoTableCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        navigationItem.title = "Crypto List"
        Services.getList { [weak self] result in
            switch result {
            case .success(let response):
                
                if let coins = response.data?.coins {
                    self?.cellVMs = coins.map({ .init(model: $0 )})
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        
        tableView.register(.init(nibName: "CryptoTableCell", bundle: nil), forCellReuseIdentifier: "x")
    }
    
}

extension CryptoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "x", for: indexPath) as? CryptoTableCell else { return .init() }
//        let cell = tableView.dequeueReusableCell(for: CryptoTableCell.self, for: indexPath)
        cell.configure(with: cellVMs[indexPath.row])
        return cell
    }
}
