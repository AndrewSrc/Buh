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
    func addWallet(wallet: Wallet)
    func fetchWallets()
}

class WalletServiceImp:WalletService{
    weak var delegate: WalletServiceDelegate?
    var networkService: Network
    
    init(networkService: Network){
        self.networkService = networkService
    }
    func addWallet(wallet: Wallet) {
//        if let path = Bundle.main.path(forResource: "jsontest", ofType: "json"){
//            do {
//                let url = URL(fileURLWithPath: path)
//                let data = try Data(contentsOf: url, options: .mappedIfSafe)
//                let wallets = try?
//                    JSONDecoder().decode([Wallet].self, from: data)
//                print (wallets)
//
//            } catch {}
//        }
        let  url = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileNewAccount&AccName=" + wallet.name
        let options = RequestOptions(url: URL(string: url)!)
        options.method = .post
        _ = networkService.performRequest(
            options: options, completion: {
            [unowned self] response, data in
                let success = (response as! HTTPURLResponse).statusCode == 200
                self.delegate?.didAdd(success: success)
        })
    }
    
    func fetchWallets() {
        let  urlString = "https://mybuh.club/Accounts_Controler.php?Class=MainAccounts&Metod1=MobileGetAccounts&Metod2=MobileDisplay"
        let url = URL(string: urlString)
        let options = RequestOptions(url: url!)
        options.method = .post
        _ = networkService.performRequest(
            options: options, completion: {
                [unowned self] response, data in
                if data != nil {
                    let wallets =  try? JSONDecoder().decode([Wallet].self, from: data!)
                
                if let parseWallets = wallets {
                    DispatchQueue.main.async {
                        self.delegate?.didGet(wallets: parseWallets)
                    }
                    
                }
                }
//                let success = (response as! HTTPURLResponse).statusCode == 200
//                self.delegate?.didAdd(success: success)
        })
//
//        if let path = Bundle.main.path(forResource: "jsontest", ofType: "json"){
//            do {
//                let url = URL(fileURLWithPath: path)
//                let data = try Data(contentsOf: url, options: .mappedIfSafe)
//                let wallets = try?
//                    JSONDecoder().decode([Wallet].self, from: data)
//                print (wallets)
//
//            } catch {}
//        }
    }
    
}
