//
//  AddWalletViewController.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    var wallets: [Wallet]?
    
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
        self.wallets = wallets
        table.reloadData()
    }
}

extension WalletViewController: UITableViewDataSource,
UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallets?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell")!
        let wallet = wallets![indexPath.row]
        cell.textLabel?.text = wallet.name
        return cell;
    }
}
