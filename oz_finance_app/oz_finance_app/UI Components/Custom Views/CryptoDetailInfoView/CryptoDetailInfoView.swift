//
//  CryptoDetailInfoView.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

protocol CryptoDetailInfoViewDelegate: AnyObject {
    func didTapWebsite()
    func didTapShowChart()
}

final class CryptoDetailInfoView: BaseView {

    //MARK: - IBOutlets
    @IBOutlet private weak var marketCapLabel: UILabel!
    @IBOutlet private weak var volume24hLabel: UILabel!
    @IBOutlet private weak var listedAtLabel: UILabel!
    @IBOutlet private weak var btcPriceLabel: UILabel!
    
    //MARK: - Properties
    weak var delegate: CryptoDetailInfoViewDelegate?
    
    //MARK: - Configure
    func configure(with model: CryptoTableCellViewModel) {
        self.marketCapLabel.text = "Market Cap: " + model.formattedValue(with: model.sortableMarketCap)
        self.volume24hLabel.text = "24h Volume: " + model.formattedValue(with: model.sortable24HVolume)
        self.listedAtLabel.text = "Listed At: " + model.formattedValue(with: model.sortableListedAt)
        self.btcPriceLabel.text = "BTC Price: " + model.formattedValue(with: model.btcPrice)
    }
    
    //MARK: - IBActions
    @IBAction private func didTapWebsite(_ sender: UIButton) {
        self.delegate?.didTapWebsite()
    }
    
    @IBAction private func didTapShowChart(_ sender: UIButton) {
        self.delegate?.didTapShowChart()
    }
}
