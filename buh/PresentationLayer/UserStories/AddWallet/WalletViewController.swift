//
//  AddWalletViewController.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    
    var presenter: WalletOutput!
    override func viewDidLoad() {
        super.viewDidLoad()
        assebly()
        presenter.getWallets()
    }
    func assebly(){
        let network = URLSessionNetwork()
        let service = WalletServiceImp(networkService: network)
        let presenter = WalletPresenter(view: self, walletService: service)
        self.presenter = presenter
    }

}

extension WalletViewController: WalletInput{
    func set(wallets: [Wallet]) {
        print(wallets)
    }
}
