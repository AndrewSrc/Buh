//
//  MainViewController.swift
//  buh
//
//  Created by Пользователь on 28/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var spendTable: UITableView!
    private let cellId = "spendCell"
    var spends = [Spend]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSpends()
    }
    func fetchSpends(){
        let service = SpendServiceImpl(networkService: URLSessionNetwork())
        service.fetch(completion: {spends in
            self.spends = spends
            self.spendTable.reloadData()
        })
    }
        // Do any additional setup after loading the view.
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spends.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        let spend  = spends[indexPath.row]
        cell.textLabel?.text = spend.name
        cell.detailTextLabel?.text = String(spend.summ)
        return cell
    }
    
}
