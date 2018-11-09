//
//  addWalletContracts.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

protocol WalletInput: class {
    func set(wallets: [Wallet])
}

protocol  WalletOutput {
    var view: WalletInput! {get set}
    func getWallets()
    func onAddPressed()
}
