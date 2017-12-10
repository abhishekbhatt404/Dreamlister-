//
//  ItemDetailsVC.swift
//  Dreamlister!
//
//  Created by abhishek bhatt on 29/11/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit
import  CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var priceField: UITextField!
    @IBOutlet var detailsFiels:
    UITextField!
    @IBOutlet var storePicker: UIPickerView!
  
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
        storePicker.delegate = self
        storePicker.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let store = Store(context: context)
        store.name =  "Best Buy"
        let store2 = Store(context: context)
        store.name =  "Tesla Dealership"
        let store3 = Store(context: context)
        store.name =  "Frys Electronics"
        let store4 = Store(context: context)
        store.name =  "Target"
        let store5 = Store(context: context)
        store.name =  "Amazon"
        let store6 = Store(context: context)
        store.name =  "K Mart"
        ad.saveContext()
        getStores()
        if itemToEdit != nil{
            loadItemData()
        }
   }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, foent component: Int) -> String? {
        let store = stores[row]
        return store.name 
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    func getStores(){
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do{
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        }
        catch{
            //error catch
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        var item: Item!
        let picture = Image(context: context)
        picture.image = thumbImage.image
        
        item.toImage  = picture
        
        if itemToEdit == nil{
            item = Item(context: context)
        }
        else{
            item = itemToEdit
        }
       
        if let titel = titleField.text{
            item.title = title
        }
        if let price = priceField.text{
            item.price = (price as  NSString).doubleValue
        }
        if let details = detailsFiels.text{
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    func loadItemData(){
        if let item = itemToEdit{
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsFiels.text = item.details
            
            thumbImage.image = item.toImage?.image as? UIImage
            
            if let store = item.toStore{
                var index = 0
                repeat{
                    let s = stores[index]
                    if s.name == store.name{
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                         break
                    }
                   
                    index += 1
                }while(index < stores.count)
            }
        }
    
    }
    
 
        
    @IBAction func trash(_ sender: UIBarButtonItem) {
        if itemToEdit != nil{
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage{
            thumbImage.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}



