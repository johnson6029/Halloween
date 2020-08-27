//
//  ViewController.swift
//  HalloweenTheme
//
//  Created by Johnson Khristi on 2017-11-05.
//  Copyright © 2017 Johnson Khristi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableviewMain: UITableView!
   
    var selectedAddress : String = ""
    var selectedCandies : Int = 0
    var selectedHomeImage : String = ""
    var index : NSIndexPath!
    
    static var address : [String] = ["45 Jarwick Dr", "65 Newhome Dr", "12 Uduyu Bvd", "101 Hell Dr"]
    static var candies : [Int] = [1, 3, 6, 8,]
    static var halloweenHomes : [String] = ["house2", "house3", "house4", "house5"]
   
    //Main function starts from here
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Home"
        
        tableviewMain.delegate = self
        tableviewMain.backgroundView = UIImageView(image: UIImage(named: "bg"))
        tableviewMain.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        print("After Count \(ViewController.address.count) \(ViewController.candies.count) \(ViewController.halloweenHomes.count)")
        DispatchQueue.main.async{
            self.tableviewMain.reloadData()
        }
    }
    
    @IBAction func btn_Add(_ sender: Any)//Plus button click
    {
        self.performSegue(withIdentifier: "addview", sender: self)
    }
    
    //Table view delegate methods starts
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ViewController.address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell") as! HomeViewCustomCell
        
        cell.label_Address.text = ViewController.address[indexPath.row]
        cell.imgview_Home.image = UIImage(named : ViewController.halloweenHomes[indexPath.row])
        cell.backgroundColor = UIColor(white: 1, alpha: 0.25)
        
        if(ViewController.candies[indexPath.row] >= 0 && ViewController.candies[indexPath.row] <= 1)
        {
            cell.imgview_Emotions.image = UIImage(named : "icon4")
        }
        else if(ViewController.candies[indexPath.row]  >= 2 && ViewController.candies[indexPath.row] <= 4)
        {
            cell.imgview_Emotions.image = UIImage(named : "icon3")
        }
        else if(ViewController.candies[indexPath.row] >= 5 && ViewController.candies[indexPath.row] <= 7)
        {
            cell.imgview_Emotions.image = UIImage(named : "icon2")
        }
        else if(ViewController.candies[indexPath.row] >= 8)
        {
            cell.imgview_Emotions.image = UIImage(named : "icon1")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedAddress = ViewController.address[indexPath.row]
        selectedCandies = ViewController.candies[indexPath.row]
        selectedHomeImage = ViewController.halloweenHomes[indexPath.row]
        index = indexPath as NSIndexPath
    
        self.performSegue(withIdentifier: "detailview", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            ViewController.address.remove(at: indexPath.row)
            ViewController.candies.remove(at: indexPath.row)
            ViewController.halloweenHomes.remove(at: indexPath.row)

            tableView.reloadData()
        }
    }
    //Table view delegate method ends
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)//Segue to send data to CheckResultView view controller.
    {
        if (segue.identifier == "detailview")
        {
            let detailView =  segue.destination as! DetailView
            
            detailView.address = selectedAddress
            detailView.candies = selectedCandies
            detailView.halloweenHomes = selectedHomeImage
            detailView.index = index
        }
        else if(segue.identifier == "addview")
        {
            let addView =  segue.destination as! AddView
            
            addView.address = ViewController.address
            addView.candies = ViewController.candies
            addView.halloweenHomes = ViewController.halloweenHomes
        }
    }
}

