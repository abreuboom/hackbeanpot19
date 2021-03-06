//
//  TableViewController.swift
//  HackBeanpot
//
//  Created by J. Lozano on 2/9/19.
//  Copyright © 2019 John Abreu. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

class SuggestionViewController: CustomTransitionViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tags: [String] = []
    
    var photosByTag: [[(String, String)]] = []
    var photosByLocation: [[(String, String)]] = []

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        blackView.hero.id = "button"
        tableView.hero.id = "tableView"
        
        tableView.hero.modifiers = [.translate(y: 700), .useGlobalCoordinateSpace]
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        
        blackView.layer.cornerRadius = blackView.frame.size.width/2
        blackView.layer.masksToBounds = true;
        blackView.clipsToBounds = true
        blackView.layer.borderWidth = 1.0
        blackView.layer.borderColor = UIColor.clear.cgColor
        
        blackView.layer.shadowColor = UIColor.lightGray.cgColor
        blackView.layer.shadowOffset = CGSize(width:0,height: 1.0)
        blackView.layer.shadowRadius = 4.0
        blackView.layer.shadowOpacity = 0.5
        blackView.layer.masksToBounds = true;
        blackView.layer.shadowPath = UIBezierPath(roundedRect:blackView.bounds, cornerRadius:blackView.layer.cornerRadius).cgPath
    }
    
    @objc func onTap() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
                
        tableViewCell.configure(relevantTag: tags[indexPath.row], photos: photosByTag[indexPath.row])
        
        return tableViewCell
        
    }
    
    

}
