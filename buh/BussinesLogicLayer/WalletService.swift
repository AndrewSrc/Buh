//
//  WalletService.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

protocol WalletService {
    
    func addWallet()
    //func fetchWallets() -> [Wallet]
}

class WalletServiceImp:WalletService{
    var networkService: Network
    
    init(networkService: Network){
        self.networkService = networkService
    }
    func addWallet() {
        networkService.performRequest()
    }
    
    
}
