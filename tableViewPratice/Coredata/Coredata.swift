//
//  Coredata.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//



import UIKit
import CoreData
class CoreVC: UIViewController {
 
    var detailsarray = [Person]()
    let nametxtFild : UITextField = {
      let  txtfld =  UITextField()
        txtfld.translatesAutoresizingMaskIntoConstraints = false
        txtfld.borderStyle = .roundedRect
        return txtfld
    }()
    let citytxtFild : UITextField = {
        let  txtfld =  UITextField()
        txtfld.translatesAutoresizingMaskIntoConstraints = false
        txtfld.borderStyle = .roundedRect
        return txtfld
    }()
    
    let saveButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Save Data", for: .normal)
        btn.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return btn
    }()
    let getDataButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get Data", for: .normal)
        btn.addTarget(self, action: #selector(getData), for: .touchUpInside)
        return btn
    }()
    static let height = UIScreen.main.bounds.height

   static let width = UIScreen.main.bounds.width
    let datatableView :UITableView = {
       let tblview = UITableView()
        tblview.frame = CGRect(x: 0, y: 500, width: width, height: height)
        return tblview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(nametxtFild)
        view.addSubview(citytxtFild)
        view.addSubview(saveButton)
        view.addSubview(getDataButton)
        setupConstraints()
        datatableView.register(detailCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(datatableView)
        datatableView.isHidden = true
        datatableView.dataSource = (self as? UITableViewDataSource)
        datatableView.delegate = self as? UITableViewDelegate
        
        
    }
    private func setupConstraints(){
        
        let constraint =
            [
        nametxtFild.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
        nametxtFild.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        nametxtFild.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        nametxtFild.heightAnchor.constraint(equalToConstant: 40),
        
        citytxtFild.topAnchor.constraint(equalTo: nametxtFild.bottomAnchor,constant: 50),
        citytxtFild.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        citytxtFild.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        citytxtFild.heightAnchor.constraint(equalToConstant: 40),
        
        saveButton.topAnchor.constraint(equalTo: citytxtFild.bottomAnchor,constant: 50),
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        saveButton.heightAnchor.constraint(equalToConstant: 40),
        
        getDataButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor,constant: 50),
        getDataButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        getDataButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        getDataButton.heightAnchor.constraint(equalToConstant: 40),
        ]
        NSLayoutConstraint.activate(constraint)
    }
    
   @objc private func saveData(){
    let dict = ["name":nametxtFild.text,"city":citytxtFild.text]
    DatabaseHandler.sharedInstance.savetdata(object: dict as! [String:String])
    }
    
    @objc private func getData(){
       detailsarray =  DatabaseHandler.sharedInstance.getdata()
        datatableView.isHidden = false
        datatableView.reloadData()
    }
}


extension CoreVC :UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsarray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailCell
        cell.textLabel?.text = detailsarray[indexPath.row].name
        cell.detailTextLabel?.text = detailsarray[indexPath.row].city
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
           detailsarray =   DatabaseHandler.sharedInstance.deletedata(index: indexPath.row)
            
            datatableView.deleteRows(at: [indexPath], with: .automatic)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }  
    }
}


class detailCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
