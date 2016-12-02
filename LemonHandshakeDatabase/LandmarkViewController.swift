//
//  LandmarkViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LandmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarks = [Landmark]()
    var tableView = UITableView()
    
    var backButton = UIButton()
    var backLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
    }

    func initializeViews() {
        
        self.view.addSubviews(tableView, backButton)
        backButton.addSubview(backLabel)
        
        tableView.register(LandmarkTableViewCell.self, forCellReuseIdentifier: "landmarkCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        colorizeViews()
        constrainViews()
        customizeViews()
    }
    
    func colorizeViews(){
        self.view.backgroundColor = UIColor.themePurple
        tableView.backgroundColor = UIColor.black
        backButton.backgroundColor = UIColor.themeOrange
        backLabel.textColor = UIColor.black
    }
    
    func constrainViews() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.25).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.05).isActive = true
        backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        backButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        backLabel.constrainTo(backButton)
    }
    
    func customizeViews() {
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        backLabel.text = "Back"
        backLabel.font = UIFont.init(name: "Avenir", size: 20)
        backLabel.textAlignment = .center
    }
    
    func tapBackButton() {
        self.dismiss(animated: true)
    }
    
    
    
    //MARK: - Table View Delegate and Data Source Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return landmarks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "landmarkCell", for: indexPath) as? LandmarkTableViewCell else {
            return LandmarkTableViewCell()
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.themeBlue
        } else {
            cell.backgroundColor = UIColor.themeOrange
        }
        
        cell.textLabel?.text = landmarks[indexPath.row].name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
