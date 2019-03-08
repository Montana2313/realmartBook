//
//  SecondViewController.swift
//  Artbook
//
//  Created by Özgür  Elmaslı on 8.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var yearName: UITextField!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var paintName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let realm = try! Realm()
    var artist = Artist()
    var selectedpaint_name = ""
    var selectedpaint_usernmae = ""
    var selectedpaint_date = ""
    var selected_paint_image = NSData()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let gestureRecognaizer =    UITapGestureRecognizer(target: self, action: #selector(SecondViewController.plsselectimage))
        imageView.addGestureRecognizer(gestureRecognaizer)
        
        checkit()
        
        // Do any additional setup after loading the view.
    }
    func checkit()
    {
        if selectedpaint_name != "" && selectedpaint_usernmae != "" && selectedpaint_date != ""
        {
            let image : UIImage = UIImage(data: selected_paint_image as Data, scale: 1.0)!
            paintName.text = selectedpaint_name
            artistName.text = selectedpaint_usernmae
            yearName.text = selectedpaint_date
            imageView.image = image
        }
    }
    @IBAction func SaveButton(_ sender: Any) {
        
        if artistName.text != nil && paintName.text != nil && yearName.text != nil && imageView.image != nil
        {
            artist.ArtistName = artistName.text!
            artist.ArtistX = paintName.text!
            artist.ArtistDateTime = yearName.text!
            artist.Artistimage = imageView.image!.jpegData(compressionQuality: 0.5) as NSData?
            try! realm.write {
                realm.add(artist)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Hata", message: "Boş alanlar var", preferredStyle: UIAlertController.Style.alert)
            let okbutton = UIAlertAction(title: "", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    @objc func plsselectimage()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
