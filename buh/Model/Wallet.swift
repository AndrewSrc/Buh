//
//  Wallet.swift
//  buh
//
//  Created by Пользователь on 09/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//


class Wallet: Codable {

    var name = ""
    var balance: Float = 0
    init(name: String, balance: Float){
        self.name = name
        self.balance = balance
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "AccName"
        case balance = "Summ"
    }
}
