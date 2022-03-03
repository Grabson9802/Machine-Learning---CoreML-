//
//  ViewController.swift
//  SeeFood
//
//  Created by Krystian Grabowy on 03/03/2022.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let imageView = UIImageView()
    
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonDidPress))
        
        view.addSubview(imageView)
        
        setupImageView()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    @objc func cameraButtonDidPress() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageView.backgroundColor = .systemGreen
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image =  userPickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
