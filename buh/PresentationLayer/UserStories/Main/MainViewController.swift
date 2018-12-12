//
//  MainViewController.swift
//  buh
//
//  Created by Пользователь on 28/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit
import CoreData
import RealSwift

class MainViewController: UIViewController {

    @IBOutlet weak var spendTable: UITableView!
    private let cellId = "spendCell"
    var spends = [Spend]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSpends()
        //db()
        bdRealm()
    }
    func bdRealm(){
        let dept = DebtRealm()
        dept.name = "dept name"
        dept.summ = 200
        let person = Person()
        person.name = "person"
        dept.person = person
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(dept)
        }
        let depts = realm.objects(Dept.self)
        print(depts)
    }
    
    func fetchSpends(){
        let service = SpendServiceImpl(networkService: URLSessionNetwork())
        service.fetch(completion: {spends in
            self.spends = spends
            self.spendTable.reloadData()
        })
    }
    
    func db(){
        let context = CoreDataManager.persistentContainer.viewContext
        let deptEntity = NSEntityDescription.entity(forEntityName: "Dept", in: context)
        let dept = NSManagedObject(entity: deptEntity!, insertInto: context)
        dept.setValue("dept name2", forKey: "name")
        dept.setValue(200, forKey: "summ")
        
        let creditorEntity = NSEntityDescription.entity(forEntityName: "Creditor", in: context)
        let creditor = NSManagedObject(entity: creditorEntity!, insertInto: context)
        creditor.setValue("Vasa", forKey: "name")
        creditor.setValue(1, forKey: "priority")
        
        dept.setValue(creditor, forKey: "creditor")
        
        //CoreDataManager.saveContext()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Dept")
        request.predicate = NSPredicate(format: "name = %@", "dept name")
        
        do {
            let result = try context.fetch(request)
            for dept in result as![NSManagedObject]{
                print(dept.value(forKey: "name"))
            }
        } catch {
            
        }
        
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
