//
//  AddSpenViewController.swift
//  buh
//
//  Created by Пользователь on 21/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit


class AddSpenViewController: UITableViewController {

    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var categotyLabel: UILabel!
    @IBOutlet weak var summTF: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var presenter: AddSpendOutput!
    
    var wallet = Wallet()
//    var spendService: SpendService
//    
//    init(spendService: SpendService){
//        self.spendService = spendService
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let walletViewController = segue.destination as! WalletViewController
        walletViewController.delegate = self
    }
    @objc func add() {
        presenter.add(spend: <#T##Spend#>)
    }
    
}

extension AddSpenViewController: AddSpendInput {
    func didAddSpend() {
//        spendService.add (spend: spend, complition: { [unowned self] success in
//            self.view.didAddSpend()
//
        }
    
    
    
}

extension AddSpenViewController: WalletViewControllerDelegate {
    func didSelec(wallet: Wallet) {
        self.wallet = wallet
        walletLabel.text = wallet.name
    }
}
