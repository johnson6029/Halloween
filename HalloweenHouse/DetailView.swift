//
//  DetailView.swift
//  HalloweenTheme
//
//  Created by Johnson Khristi  on 2017-11-05.
//  Copyright © 2017 Johnson Khristi . All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController, UITextFieldDelegate
{    
    @IBOutlet weak var img_home: UIImageView!
    @IBOutlet weak var txt_no_ofcandies: UITextField!
    @IBOutlet weak var txt_address: UITextField!
    @IBOutlet weak var imgview_NoOfCandies: UIImageView!
    
    var address : String = ""
    var candies : Int = 0
    var halloweenHomes : String = ""
    var index : NSIndexPath!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "House data"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        view.addGestureRecognizer(tapGesture)
        
        txt_no_ofcandies.delegate = self

        leftbarbutton()
        misc()
    }
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    func misc()
    {
        
        txt_address.text = address
        txt_no_ofcandies.text = String(candies)
        img_home.image = UIImage(named : halloweenHomes)
        
        if(candies >= 0 && candies <= 1)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon4")
        }
        else if(candies  >= 2 && candies <= 4)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon3")
        }
        else if(candies >= 5 && candies <= 7)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon2")
        }
        else if(candies >= 8)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon1")
        }
    }
    
    func leftbarbutton ()
    {
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
    }
    
    @objc func addTapped()
    {
        self.view.endEditing(true)
        
        if(txt_no_ofcandies.text?.isEmpty == false || txt_address.text?.isEmpty == false)
        {
            let alertController = UIAlertController(title: "Happy Halloween", message: "Do you want to save?", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) {
                (result : UIAlertAction) -> Void in
                
                ViewController.address[self.index.row] = self.txt_address.text!
                ViewController.candies[self.index.row] = Int(self.txt_no_ofcandies.text!)!
                //ViewController.halloweenHomes.append("home1")
                
                self.navigationController?.popViewController(animated: true)
            })
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }

    @objc func leftButtonTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(txt_no_ofcandies.text != nil || txt_no_ofcandies.text != "")
        {
            if(txt_no_ofcandies.text?.isEmpty == false)
            {
                if(Int(txt_no_ofcandies.text!)! >= 0 && Int(txt_no_ofcandies.text!)! <= 1)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon5")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 2 && Int(txt_no_ofcandies.text!)! <= 4)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon4")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 5 && Int(txt_no_ofcandies.text!)! <= 7)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon3")
                }
                else if(Int(txt_no_ofcandies.text!)! >= 8)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon1")
                }
            }
            else
            {
                imgview_NoOfCandies.image = UIImage(named : "")
            }
        }
        
        return true
    }
}
