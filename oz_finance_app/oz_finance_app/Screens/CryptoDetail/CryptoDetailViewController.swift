//
//  CryptoDetailViewController.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

protocol CryptoDetailInterface: AnyObject {
    func setNavigationTitle(with title: String, with subtitle: String)
    func setupHeaderView()
    func setupInfoView()
}

final class CryptoDetailViewController: UIViewController {

    @IBOutlet private weak var infoView: CryptoDetailInfoView!
    @IBOutlet private weak var headerView: CryptoDetailHeaderView!
    
    private let viewModel: CryptoDetailViewModel
    
    init(viewModel: CryptoDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CryptoDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        infoView.delegate = self
        viewModel.viewDidLoad()
        
    }
}

//MARK: - CryptoDetailViewModelInterface
extension CryptoDetailViewController: CryptoDetailInterface {
    func setNavigationTitle(with title: String, with subtitle: String) {
        navigationItem.setTitle(title, subtitle: subtitle)
    }
    
    func setupHeaderView() {
        headerView.configure(with: viewModel.cellVM)
    }
    
    func setupInfoView() {
        infoView.configure(with: viewModel.cellVM)
    }
}


//MARK: - CrpytoDetailInfoViewDelegate
extension CryptoDetailViewController: CryptoDetailInfoViewDelegate {
    func didTapWebsite() {
        //TODO: - Website
    }
    
    func didTapShowChart() {
        //TODO: - Chart
    }
}
