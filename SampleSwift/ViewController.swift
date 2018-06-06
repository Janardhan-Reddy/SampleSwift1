//
//  ViewController.swift
//  SampleSwift
//
//  Created by apple on 03/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblNames: UITableView!
     let cellReuseIdentifier = "cell"
    @IBOutlet weak var txtValue: UITextField!
    var arrNames:NSMutableArray!
 
    
    var  barRight = UIBarButtonItem(title: UserDefaults.standard.string(forKey: "Name"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(buttonSelected(sender:)))
    
    
    
    
    
    @objc func buttonSelected(sender:Any) -> Void {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        arrNames=NSMutableArray()
       
      self.tblNames.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
       // let farray = arr.filter {$0 != "b"}
        
        self.navigationItem.rightBarButtonItem=barRight;
        
        arrNames.addObjects(from: [UserDefaults.standard.string(forKey: "Name")!])
        
        
      
        if let path = Bundle.main.path(forResource: "agility-event-EventSchedule-export", ofType: "json") {
            do {
                let dataFromNetworking = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
//                    // do stuff
//                }
                  let json = try JSON(data: dataFromNetworking)
                print("JsonData-",json.dictionary?.index(forKey: "event_1") ?? "0")
                print("JsonData-",json["event_1"]["eventSession"]["session_1"]["sessionPresenter"] )
                
               
            } catch {
                // handle error
            }
        }
      
        
        
        
 
    }
    @IBAction func AddingValues(_ sender: Any) {
       
       
        arrNames.addObjects(from: [txtValue.text ?? "nil"])
         print(arrNames)
        self.tblNames.reloadData()
     
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:UITableViewCell = self.tblNames.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = arrNames.object(at: indexPath.row) as? String;
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//        arrNames.removeObject(at: indexPath.row);
//        self.tblNames.reloadData()
        
        UserDefaults.standard.set(indexPath.row, forKey: "row");
        UserDefaults.standard.set(arrNames[indexPath.row], forKey: "RowValue");
         arrNames.addObjects(from: [UserDefaults.standard.string(forKey: "Name")!])
        let NextVC=self.storyboard?.instantiateViewController(withIdentifier: "secondController") as! secondController
        self.navigationController?.pushViewController(NextVC, animated: true);
    
    }
}

