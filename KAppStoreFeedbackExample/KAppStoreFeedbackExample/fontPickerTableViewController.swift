//
//  fontPickerTableViewController.swift
//  KAppStoreFeedbackExample
//
//  Created by Prajwal Karanayyana Vasantha on 7/13/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

class fontPickerTableViewController: UITableViewController {

    var fontList : Array<UIFont> =
                    [UIFont.systemFont(ofSize: 14, weight: .medium),
                     UIFont.systemFont(ofSize: 14, weight: .bold),
                     UIFont.systemFont(ofSize: 14, weight: .semibold),
                     UIFont.systemFont(ofSize: 14, weight: .regular),
                     UIFont.italicSystemFont(ofSize: 14),
                     UIFont.systemFont(ofSize: 16, weight: .medium),
                     UIFont.systemFont(ofSize: 16, weight: .bold),
                     UIFont.systemFont(ofSize: 16, weight: .semibold),
                     UIFont.systemFont(ofSize: 16, weight: .regular),
                      UIFont.italicSystemFont(ofSize: 16),
                     UIFont.systemFont(ofSize: 18, weight: .medium),
                     UIFont.systemFont(ofSize: 18, weight: .bold),
                     UIFont.systemFont(ofSize: 18, weight: .semibold),
                     UIFont.systemFont(ofSize: 18, weight: .regular),
                     UIFont.italicSystemFont(ofSize: 18)]
    
    var fontNameDict = [UIFont.systemFont(ofSize: 14, weight: .medium) : "System Font 14 (medium)",
                     UIFont.systemFont(ofSize: 14, weight: .bold): "System Font 14 (bold)",
                     UIFont.systemFont(ofSize: 14, weight: .semibold): "System Font 14 (semibold)",
                     UIFont.systemFont(ofSize: 14, weight: .regular): "System Font 14 (regular)",
                     UIFont.italicSystemFont(ofSize: 14): "System Font 14 (italics)",
                     UIFont.systemFont(ofSize: 16, weight: .medium): "System Font 16 (medium)",
                     UIFont.systemFont(ofSize: 16, weight: .bold): "System Font 16 (bold)",
                     UIFont.systemFont(ofSize: 16, weight: .semibold): "System Font 16 (semibold)",
                     UIFont.systemFont(ofSize: 16, weight: .regular): "System Font 16 (regular)",
                     UIFont.italicSystemFont(ofSize: 16): "System Font 16 (italics)",
                     UIFont.systemFont(ofSize: 18, weight: .medium): "System Font 18 (medium)",
                     UIFont.systemFont(ofSize: 18, weight: .bold): "System Font 18 (bold)",
                     UIFont.systemFont(ofSize: 18, weight: .semibold): "System Font 18 (semibold)",
                     UIFont.systemFont(ofSize: 18, weight: .regular): "System Font 18 (regular)",
                     UIFont.italicSystemFont(ofSize: 18): "System Font 18 (italics)"]
    
    var selectedButton : UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return fontList.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontPickerCell", for: indexPath)
        if indexPath.section == 0{
            cell.textLabel?.text = "Clear Selection / Add in fontPickerTableViewController"
            cell.textLabel?.textColor = UIColor.black
        }else {
            cell.textLabel?.text =  fontNameDict[fontList[indexPath.row]]
            cell.textLabel?.font = fontList[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard selectedButton != nil else {
            return
        }
        if indexPath.section == 0 {
            selectedButton?.isSelected = false
            selectedButton?.titleLabel?.font =  UIFont.systemFont(ofSize: 14)
        }else {
            selectedButton?.isSelected = true
            let font = fontList[indexPath.row]
            selectedButton?.titleLabel?.font =  font
        }
        self.navigationController?.popViewController(animated: true)
    }
}
