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
        //networkService.performRequest()
    }
    
    func fetchWallets() {
        let wallets = [
            Wallet(name:"Main", balance: 100000),
            Wallet(name:"Second", balance: 10)
        ]
        delegate?.didGet(wallets: wallets)
        
    
    }
    
}
