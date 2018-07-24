//
//  colorPickerTableViewController.swift
//  KAppStoreFeedbackExample
//
//  Created by Prajwal Karanayyana Vasantha on 7/13/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

class colorPickerTableViewController: UITableViewController {

    var colorList : Array<UIColor> = [UIColor.black , UIColor.red, UIColor.gray, UIColor.green, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.lightGray, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.white, UIColor.yellow]
    
    var colorName = [UIColor.black :"black" , UIColor.red: "red", UIColor.gray : "gray", UIColor.green : "green", UIColor.blue :"blue", UIColor.brown : "brown", UIColor.cyan: "cyan", UIColor.darkGray : "darkGray", UIColor.lightGray : "lightGray", UIColor.magenta : "magenta", UIColor.orange : "orange", UIColor.purple : "purple", UIColor.white : "white", UIColor.yellow : "yellow"]
    
    var selectedButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return colorList.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorPickerCell", for: indexPath)
        if indexPath.section == 0{
            cell.textLabel?.text = "Clear Selection / Add in colorPickerTableViewController"
            cell.textLabel?.textColor = UIColor.black
        }else {
            cell.textLabel?.text =  colorName[colorList[indexPath.row]]
            cell.textLabel?.textColor = colorList[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard selectedButton != nil else {
            return
        }
        if indexPath.section == 0 {
            selectedButton?.isSelected = false
        }else {
            selectedButton?.isSelected = true
            let color = colorList[indexPath.row]
            selectedButton?.tintColor = color
        }
       self.navigationController?.popViewController(animated: true)
    }


}
