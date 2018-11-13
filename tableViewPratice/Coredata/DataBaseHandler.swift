//
//  File.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import CoreData
class DatabaseHandler: NSObject {
    let managedcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

static let sharedInstance = DatabaseHandler()

    func savetdata(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedcontext) as! Person
        student.name = object["name"]
        student.city = object["city"]
        do {
            try managedcontext.save()
        }
        catch {
            print(error.localizedDescription,"error")
        }
        
    }
    
    func getdata() -> [Person] {
        var student = [Person]()
        let fetchRequest  = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        do {
            student = try managedcontext.fetch(fetchRequest) as!  [Person]
            
        }
        catch {
            print("error")
        }
        return student
    }
    
    
    func deletedata(index: Int)-> [Person]{
        var perosndata = getdata()
        managedcontext.delete(perosndata[index])
        perosndata.remove(at: index)
        do {
            
             try managedcontext.save()
        }
        catch {
            print(error.localizedDescription,"error while deleteing data")
        }
        return perosndata
    
    }
    
    
}
