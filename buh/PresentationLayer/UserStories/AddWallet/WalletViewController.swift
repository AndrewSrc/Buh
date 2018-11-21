//
//  AddWalletViewController.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var walletNewName: UITextField!
    
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
    
    @IBAction func onAddPressed(_ sender: Any) {
        if let name = walletNewName.text {
            self.presenter.onAddPressed(name: name)
        }
        
        
    }
    
}

extension WalletViewController: WalletInput{
    func set(wallets: [Wallet]) {
        print(wallets)
        self.wallets = wallets
        table.reloadData()
    }
    func walletAdded (success: Bool){
        if success {
            presenter.getWallets()
        } else {
            // alert
        }
    }
}

extension WalletViewController: UITableViewDataSource,
UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallets?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell")!
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "walletCell")
        //cell.sty = .
        let wallet = wallets![indexPath.row]
        cell.textLabel?.text = wallet.name
        cell.detailTextLabel?.text = "\(wallet.balance)"
        return cell;
    }
}
