//
//  AddItemViewController.swift
//  Collector
//
//  Created by Kevin Mudiandambo on 11/17/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleTextfield: UITextField!
    
    //MARK: Properties
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup the delagate
        // alerts when user taps on a particular image
        imagePicker.delegate = self
    }
    
    //MARK: Actions
    @IBAction func photosTapped(_ sender: Any) {
        // allow the user to pick an image with picker
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
    }
    
    /*
     Function gets called whenever a user clicks on a particular image
     Set the chosen image to the imageView
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            itemImageView.image = chosenImage
        }
        // dismiss the image picker
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
