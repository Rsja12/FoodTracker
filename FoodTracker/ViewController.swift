//
//  ViewController.swift
//  FoodTracker
//
//  Created by Alfonso on 9/28/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
        textField.text = ""
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss imagePickerController when user taps cancel.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        // Unwrap optional returned by info dictionary and casts it as UIImage. Sets the UIImage as the value for selectedImage
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage else {
                    fatalError("Expected a dictionary containing an image but instead received the following: \(info)")
        }
        
        // Set photoImageView to display the selectedImage & dismiss picker.
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide Keyboard (if user taps image view while typing in the keyboard).
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController - a view controller that lets user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // only allows photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    

}

