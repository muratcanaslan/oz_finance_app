//
//  CryptoListViewController.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import UIKit

class CryptoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Services.getList { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
