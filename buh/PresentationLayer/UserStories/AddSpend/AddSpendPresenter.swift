//
//  AddSpendPresenter.swift
//  buh
//
//  Created by Пользователь on 21/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

class AddSpendPresenter{
    weak var view: AddSpendInput!
    var spendService: SpendService
    
    init(spendService: SpendService){
        self.spendService = spendService
    }
}

extension AddSpendPresenter: AddSpendOutput{
    func add(spend: Spend) {
        spendService.add(spend: spend,
                         completion: {[unowned self] success in self.view.didAddSpend()
    })
    }      
}
