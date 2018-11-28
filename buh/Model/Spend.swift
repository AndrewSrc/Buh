//
//  Spend.swift
//  buh
//
//  Created by Пользователь on 23/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

class Spend: Codable {
    var wallet = Wallet()
    var summ = 0.0
    var name = ""
    
    init(){
        
    }
    init(wallet: Wallet){
        //self.wallet = wallet
    }
    
    enum CodingKeys: String, CodingKey {
        case summ = "summ"
        case name = "ProdName"
    }
}
