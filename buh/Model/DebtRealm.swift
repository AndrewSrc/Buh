//
//  Debt.swift
//  buh
//
//  Created by Пользователь on 12/12/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import RealmSwift

class DebtRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var summ = 0.0
    @objc dynamic var person: Person?
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var priority = 0
}
