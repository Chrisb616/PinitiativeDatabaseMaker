//
//  UnlocatedViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class UnlocatedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    var unlocatedLandmarks = [Landmark]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unlocatedLandmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unlocatedCell")
        
        return cell!
    }
    
    func setUpTableView() {
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UnlocatedTableViewCell.self, forCellReuseIdentifier: "unlocatedCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.height.constraints
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
