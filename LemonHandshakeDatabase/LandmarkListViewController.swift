//
//  LandmarkListViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LandmarkListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let store = DataStore.sharedInstance
    
    var filteredLandmarks = [Landmark]()
    var landmarks = [Landmark]()
    var tableView = UITableView()
    
    var backButton = UIButton()
    var backLabel = UILabel()
    
    var filterTextField = UITextField()
    var filterButton = UIButton()
    var filterIconImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        colorizeViews()
        constrainViews()
        customizeViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func initializeViews() {
        
        landmarks = store.landmarks
        filteredLandmarks = landmarks
        
        self.view.addSubviews(tableView, backButton, filterTextField, filterButton)
        backButton.addSubview(backLabel)
        filterButton.addSubview(filterIconImageView)
        
        tableView.register(LandmarkTableViewCell.self, forCellReuseIdentifier: "landmarkCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        filterTextField.delegate = self
    }
    
    func colorizeViews(){
        self.view.backgroundColor = UIColor.themePurple
        tableView.backgroundColor = UIColor.black
        backButton.backgroundColor = UIColor.themeOrange
        backLabel.textColor = UIColor.black
        filterTextField.backgroundColor = UIColor.white
        filterButton.backgroundColor = UIColor.themeOrange
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
        
        filterTextField.translatesAutoresizingMaskIntoConstraints = false
        
        filterTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        filterTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        filterTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        filterTextField.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -30).isActive = true
        
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.topAnchor.constraint(equalTo: filterTextField.topAnchor).isActive = true
        filterButton.bottomAnchor.constraint(equalTo: filterTextField.bottomAnchor).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: filterTextField.trailingAnchor, constant: 10).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        
        filterIconImageView.constrainTo(filterButton)
    }
    
    func customizeViews() {
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        backLabel.text = "Back"
        backLabel.font = UIFont.init(name: "Avenir", size: 20)
        backLabel.textAlignment = .center
        
        filterTextField.layer.cornerRadius = 10
        filterButton.layer.cornerRadius = 10
        
        filterIconImageView.image = UIImage(named: "filter-icon-0")
        filterIconImageView.contentMode = .scaleAspectFit
        
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
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
        return filteredLandmarks.count
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
        
        let landmark = filteredLandmarks[indexPath.row]
        
        cell.textLabel?.text = landmark.name
        
        if landmark.edited {
            cell.textLabel?.text = landmark.name + " - *EDITED*"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = LandmarkDetailViewController()
        
        dest.landmark = filteredLandmarks[indexPath.row]
        
        present(dest, animated: true)
    }
    
    
    func filterButtonTapped() {
        if let text = filterTextField.text {
            filterTo(text)
            tableView.reloadData()
        }
    }
    
    func filterTo(_ string: String) {
        filteredLandmarks.removeAll()
        
        for landmark in landmarks {
            if landmark.name.contains(string) {
                filteredLandmarks.append(landmark)
            } else if landmark.agency.contains(string) {
                filteredLandmarks.append(landmark)
            } else if landmark.borough.contains(string) {
                filteredLandmarks.append(landmark)
            } else if landmark.address.contains(string) {
                filteredLandmarks.append(landmark)
            } else if landmark.useDescription.contains(string) {
                filteredLandmarks.append(landmark)
            }
        }
    }

}
