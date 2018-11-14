//
//  WalletService.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

protocol WalletServiceDelegate: class {
    func didGet(wallets: [Wallet])
    func didAdd(wallet: Wallet)
}
protocol WalletService {
    var delegate: WalletServiceDelegate? {get set}
    func addWallet()
    func fetchWallets()
}

class WalletServiceImp:WalletService{
    weak var delegate: WalletServiceDelegate?
    var networkService: Network
    
    init(networkService: Network){
        self.networkService = networkService
    }
    func addWallet() {
        let  url = "http://www.google.com"
        let options = RequestOptions(url: URL(string: url)!)
        _ = networkService.performRequest(
            options: options, completion:
            {response, data in
                self.delegate?.didAdd(wallet: Wallet(name:"test", balance: 0))
        })
    }
    
    func fetchWallets() {
        let wallets = [
            Wallet(name:"Main", balance: 100000),
            Wallet(name:"Second", balance: 10)
        ]
        delegate?.didGet(wallets: wallets)
        
    
    }
    
}
