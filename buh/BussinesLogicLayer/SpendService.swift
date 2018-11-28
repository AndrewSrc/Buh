//
//  SpendService.swift
//  buh
//
//  Created by Пользователь on 23/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

typealias Complition = (Bool) -> ()
typealias FetcCompletion = ([Spend]) -> ()

protocol SpendService {
    func add(spend: Spend, completion: @escaping Complition)//, complition: Complition
    func fetch(completion: FetcCompletion)
}

class SpendServiceImpl: SpendService{
    var networkService: Network
    init(networkService: Network){
        self.networkService = networkService
    }
    
    func fetch(completion: FetcCompletion) {
        let  url = "https://mybuh.club/Debet_Credit_Controler.php?Class=DebCred&Method1=LoadDebCred2&TypeLoad=Mobile&CurDate=13.11.2018&Method2=DisplayMobile" // + "\(spend.wallet.id)"+"&Summ=" + "\(spend.summ)"
        let options = RequestOptions(url: URL(string: url)!)
        options.method = .post
        _ = networkService.performRequest(
            options: options, completion: {
                response, data in
                let success = (response as! HTTPURLResponse).statusCode == 200
                
                //self.delegate?.didAdd(success: success)
                //completion(success)
        })
    }
    
    func add(spend: Spend, completion: @escaping Complition) {
        let  url = "https://mybuh.club/Debet_Credit_Controler.php?Class=DebCred&Method1=AddDebetCreditMobile&idName=1847&CurDate=13.11.2018&idAcc=" + "\(spend.wallet.id)"+"&Summ=" + "\(spend.summ)"
        let options = RequestOptions(url: URL(string: url)!)
        options.method = .post
        _ = networkService.performRequest(
            options: options, completion: {
                response, data in
                let success = (response as! HTTPURLResponse).statusCode == 200
                //self.delegate?.didAdd(success: success)
                completion(success)
        })
    }
}
