//
//  TableViewCell.swift
//  Dreamlister!
//
//  Created by abhishek bhatt on 28/11/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var Tesla: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var Details: UILabel!
    
    func configureCell(item: Item){
        
        Title.text = item.title
        Price.text = "$\(item.price)"
        Details.text = item.details
        
    }
}

