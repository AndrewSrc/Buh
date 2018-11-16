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
    func didAdd(success: Bool)
}
protocol WalletService {
    var delegate: WalletServiceDelegate? {get set}
    func addWallet(name: Wallet)
    func fetchWallets()
}

class WalletServiceImp:WalletService{
    weak var delegate: WalletServiceDelegate?
    var networkService: Network
    
    init(networkService: Network){
        self.networkService = networkService
    }
    func addWallet(name: Wallet) {
        let  url = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileNewAccount&AccName=test"
        let options = RequestOptions(url: URL(string: url)!)
        _ = networkService.performRequest(
            options: options, completion: {
            [unowned self] response, data in
                let success = (response as! HTTPURLResponse).statusCode == 200
                self.delegate?.didAdd(success: success)
        })
    }
    
    func fetchWallets() {
        let  url = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileGetAccounts&Metod2=MobileDisplay"
        let options = RequestOptions(url: URL(string: url)!)
        options.method = .post
        _ = networkService.performRequest(
            options: options, completion: {
                [unowned self] response, data in
                if data != nil {
                    let wallets =  try? JSONDecoder().decode([Wallet].self, from: data!)
                }
                
                let success = (response as! HTTPURLResponse).statusCode == 200
                self.delegate?.didAdd(success: success)
        })
    }
    
}
