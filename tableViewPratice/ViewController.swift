//
//  ViewController.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var showTableviewButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.setTitle("Show table View", for: .normal)
        button.addTarget(self, action: #selector(showTableview), for: .touchUpInside)
        return button
    }()
    
    var showCollectioViewButton : UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Collection View", for: .normal)
        button.addTarget(self, action: #selector(showCollectioView), for: .touchUpInside)
        return button
    }()
    
    
    var shownotification : UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Notification", for: .normal)
        button.addTarget(self, action: #selector(notification), for: .touchUpInside)
        return button
    }()
    
    var coredata : UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SaveButton ", for: .normal)
        button.addTarget(self, action: #selector(coreData), for: .touchUpInside)
        return button
    }()
    
    var alertButton : UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Alert ", for: .normal)
        button.addTarget(self, action: #selector(alert), for: .touchUpInside)
        return button
    }()
    
    var alertButtonwithTextFiled : UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("alertButtonwithTextFiled", for: .normal)
        button.addTarget(self, action: #selector(alertWithTextField), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(showTableviewButton)
        view.addSubview(showCollectioViewButton)
        view.addSubview(shownotification)
        view.addSubview(coredata)
        view.addSubview(alertButton)
        view.addSubview(alertButtonwithTextFiled)
        setupConstraints()
            
     
    }

    @objc private func showTableview(){
       let tablVC = ListVC()
        navigationController?.pushViewController(tablVC, animated: true)
    }
    @objc private func showCollectioView(){
        let layout = UICollectionViewFlowLayout()
        let colletionVC = CollectionVC.init(collectionViewLayout: layout)
        navigationController?.pushViewController(colletionVC, animated: true)
    }
    @objc private func alertWithTextField(){
        let aler = UIAlertController(title: "alert", message: "alert message", preferredStyle: UIAlertController.Style.alert)
        let ockAction = UIAlertAction(title: "OK", style: .default) { (_) in
        }
        let ockAction1 = UIAlertAction(title: "OK", style: .default) { (_) in
        }
        let ockAction2 = UIAlertAction(title: "OK", style: .default) { (_) in
        }
        aler.addTextField { (textField) -> Void in
            textField.textColor = UIColor.green
        }
        aler.addAction(ockAction)
        aler.addAction(ockAction1)
        aler.addAction(ockAction2)

        present(aler, animated: true, completion: nil)
  
    }
    
    @objc private func alert(){
     let alert = UIAlertController(title: "SAMPLE Alert", message: "try out things", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { (_) in
            
        }
        alert.addTextField { (textlf) in
            textlf.placeholder = "Enter sample message"
        }
        
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func  coreData(){
        let coreVC  = CoreVC()
        navigationController?.pushViewController(coreVC, animated: true)
    }
    
    @objc private func notification(){
        let notifactionVC = NotificationVC()
        navigationController?.pushViewController(notifactionVC, animated: true)
    }
    
    
    private func setupConstraints(){
      let constrints = [
        showTableviewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
        showTableviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
        showTableviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        showTableviewButton.heightAnchor.constraint(equalToConstant: 50),
        
        showCollectioViewButton.topAnchor.constraint(equalTo: showTableviewButton.bottomAnchor,constant: 50),
        showCollectioViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        showCollectioViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        showCollectioViewButton.heightAnchor.constraint(equalToConstant: 50),
        
        
        shownotification.topAnchor.constraint(equalTo: showCollectioViewButton.bottomAnchor,constant: 50),
        shownotification.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        shownotification.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        shownotification.heightAnchor.constraint(equalToConstant: 50),
        
        
        
        coredata.topAnchor.constraint(equalTo: shownotification.bottomAnchor,constant: 50),
        coredata.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        coredata.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        coredata.heightAnchor.constraint(equalToConstant: 50),
        
        
        
        alertButton.topAnchor.constraint(equalTo: coredata.bottomAnchor,constant: 50),
        alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        alertButton.heightAnchor.constraint(equalToConstant: 50),
        
        alertButtonwithTextFiled.topAnchor.constraint(equalTo: alertButton.bottomAnchor,constant: 50),
        alertButtonwithTextFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        alertButtonwithTextFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        alertButtonwithTextFiled.heightAnchor.constraint(equalToConstant: 50),
        
        
        ]
        
        NSLayoutConstraint.activate(constrints)
    }
}

