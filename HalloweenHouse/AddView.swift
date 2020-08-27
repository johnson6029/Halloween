//
//  AddView.swift
//  HalloweenTheme
//
//  Created by Johnson Khristi  on 2017-11-01.
//  Copyright © 2017 Johnson Khristi . All rights reserved.
//

import Foundation
import UIKit

class AddView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var imghome: UIImageView!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txt_no_ofcandies: UITextField!
    @IBOutlet weak var img_emotions: UIImageView!
    
    var address : [String] = []
    var candies : [Int] = []
    var halloweenHomes : [String] = []

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add new house"
        
        print("Count \(address.count) \(candies.count) \(halloweenHomes.count)")
        
        misc()
    }
    
    func misc()
    {
        //Misc
        txt_no_ofcandies.delegate = self
        imghome.isUserInteractionEnabled = true
        imagePicker.delegate = self
        //Ends
        
        //Left bar button item
        let leftButton : UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftButtonTapped))
        leftButton.tintColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = leftButton
        //Ends
        
        //Right bar button item
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addTapped))
        logButton.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = logButton
        //Ends
        
        //Getures
       /* let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGestureForImage = UITapGestureRecognizer(target: self, action: #selector(self.tapHomeImage(_:)))
        
        view.addGestureRecognizer(tapGesture)
 */
        //imghome.addGestureRecognizer(tapGestureForImage)
        //Ends
    }
    
    @objc func leftButtonTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addTapped()
    {
        self.view.endEditing(true)
        
        if(txt_no_ofcandies.text?.isEmpty == false || txtaddress.text?.isEmpty == false)
        {
            let alertController = UIAlertController(title: "Halloween", message: "Yes! To Save the house", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) {
                (result : UIAlertAction) -> Void in
                
                ViewController.address.append(self.txtaddress.text!)
                ViewController.candies.append(Int(self.txt_no_ofcandies.text!)!)
                ViewController.halloweenHomes.append("house1")
                            
                print("After Count \(self.address.count) \(self.candies.count) \(self.halloweenHomes.count)")
                self.navigationController?.popViewController(animated: true)
            })
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
   /* @objc func tapBlurButton(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    */
    @objc func tapHomeImage(_ sender: UITapGestureRecognizer)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //Imagepicker method starts
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let fetchImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imghome.image = fetchImage
        dismiss(animated:true, completion: nil)
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //Imagepicked method ends
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(txt_no_ofcandies.text != nil || txt_no_ofcandies.text != "")
        {
            if(txt_no_ofcandies.text?.isEmpty == false)
            {
                if(Int(txt_no_ofcandies.text!)! >= 0 && Int(txt_no_ofcandies.text!)! <= 1)
                {
                    img_emotions.image = UIImage(named : "icon4")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 2 && Int(txt_no_ofcandies.text!)! <= 4)
                {
                    img_emotions.image = UIImage(named : "icon3")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 5 && Int(txt_no_ofcandies.text!)! <= 7)
                {
                    img_emotions.image = UIImage(named : "icon2")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 5 && Int(txt_no_ofcandies.text!)! <= 7)
                {
                    img_emotions.image = UIImage(named : "icon1")
                }
            }
            else
            {
                img_emotions.image = UIImage(named : "")
            }
        }
        
        return true
    }
}
