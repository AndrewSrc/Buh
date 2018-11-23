//
//  AddSpendContracts.swift
//  buh
//
//  Created by Пользователь on 21/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

protocol AddSpendInput: class {
    func didAddSpend()
}

protocol  AddSpendOutput {
    var view: AddSpendInput! { get set }
    func add(spend: Spend)
} 
