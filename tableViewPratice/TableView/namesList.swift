//
//  namesList.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
class ListVC: UITableViewController {
    var joinedarray = [String]()
    var newarray  = [[Any]]()
    var varites = ["Fruits","Vegetables","Vegutable Juices","Fruit Juices","Ice Cream Shake"]
    var fruits = ["Apple","Orange","Gova","Pineapple","Butter Fruit"]
    var vegetables = ["Tomato","Carrot","LadyFinger","Potato","Bitter Guard","Brinjal"]
    var  vegetableJuices = ["Tomato juice","Carrot Juice","BeetRoot"]
    var fruitJuice = ["Apple Juice","Sapota juice","Butter Fruit Juice","Pappaya Juice"]
    var iceCreamShaek = ["Butter Scotch","Vanila Shake","Chocolate Shake","Belgium Shake"]
    override func viewDidLoad() {
        super.viewDidLoad()
    newarray = [fruits,vegetables,vegetableJuices,fruitJuice,iceCreamShaek]
//        joinedarray = newarray.flatMap { $0 } as! [String]
//        print(joinedarray)
        
        tableView.register(listCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return varites.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newarray[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! listCell
        cell.textLabel?.text = newarray[indexPath.section][indexPath.row] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return varites[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
         view.tintColor = .red
        let header = view as!UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
}
