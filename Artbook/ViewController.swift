//
//  ViewController.swift
//  Artbook
//
//  Created by Özgür  Elmaslı on 8.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    var selected = ""
    var painttingname = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(Realm.Configuration.defaultConfiguration.fileURL)
        loadarray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "showsecond", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if painttingname.count > 0
        {
            return painttingname.count
        }
        else
        {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = painttingname[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "showsecond"
        {
            if selected != ""
            {
                let item_gelen = realm.objects(Artist.self).filter{$0.ArtistX == self.selected}.first!
               let destinationVC = segue.destination as! SecondViewController
                destinationVC.selectedpaint_name = item_gelen.ArtistX!
                destinationVC.selectedpaint_usernmae = item_gelen.ArtistName!
                destinationVC.selectedpaint_date = item_gelen.ArtistDateTime!
                destinationVC.selected_paint_image = item_gelen.Artistimage!
            }
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = painttingname[indexPath.row]
        performSegue(withIdentifier: "showsecond", sender: nil)
    }
    func loadarray()
    {
        let arraypainting = realm.objects(Artist.self)
        
        for item in arraypainting
        {
            painttingname.append(item.ArtistX!)
        }
    }
    

}

