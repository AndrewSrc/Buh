//
//  AddWalletPresenter.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

class WalletPresenter: WalletOutput{
    weak var view: WalletInput!
    var walletService: WalletService
    
    init(view: WalletInput, walletService: WalletService){
        
        self.view = view
        self.walletService = walletService
    }
    
    func onAddPressed() {
        
    }
    func getWallets() {
        
    }
}
