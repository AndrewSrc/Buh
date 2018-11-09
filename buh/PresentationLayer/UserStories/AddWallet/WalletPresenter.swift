//
//  AddWalletPresenter.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

class WalletPresenter {
    
    weak var view: WalletInput!
    var walletService: WalletService
    
    
    init(view: WalletInput, walletService: WalletService){
        self.view = view
        self.walletService = walletService
        self.walletService.delegate = self
    }
}

extension WalletPresenter: WalletOutput{
    func getWallets() {
        walletService.fetchWallets()
    }
    func onAddPressed() {
        
    }
}

extension WalletPresenter: WalletServiceDelegate {
    
    func didGet(wallets: [Wallet]) {
        view.set(wallets: wallets)
    }
}
