//
//  ViewController.swift
//  WhatFlower
//
//  Created by Isaac Iniongun on 26/04/2019.
//  Copyright © 2019 Isaac Iniongun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userImage
        } else {
            print("Unable to get user image.")
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }


    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }
}

