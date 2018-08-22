//
//  OneController.swift
//  SampleSwift
//
//  Created by apple on 17/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class OneController: UIViewController,UIAlertViewDelegate {
    
    @IBAction func callCollectionView(_ sender: Any) {
        
        let NextVC=self.storyboard?.instantiateViewController(withIdentifier: "collectionViewController")
        self.navigationController?.pushViewController(NextVC!, animated: true);
    }
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUName: UITextField!
    var alertController:UIAlertController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtUName.text? = "abcd"
        txtPassword.text? = "abcd"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func forgotAction(_ sender: Any) {
        self.alertMessages(message: "Forgot");
        
    }
    @IBAction func Userlogin(_ sender: Any) {
        if txtUName.text?.count==0   {
            self.alertMessages(message: "Please Enter UserName");
        }
        else if txtPassword.text?.count==0{
            self.alertMessages(message: "Please Enter Password");
        }
        else
        {
            UserDefaults.standard.set(txtUName.text, forKey: "Name");
            let NextVC=self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(NextVC!, animated: true);
            
            
        }
        
        
        
    }
    
    func alertMessages(message:NSString) -> Void {
        
        
        
        alertController=UIAlertController(title: "uCustoms", message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let Cancel=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            (result:UIAlertAction)->Void in
            
            
        }
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (result : UIAlertAction) -> Void in
            
            if message=="Forgot"
            {
                let firstTextField = self.alertController.textFields![0] as UITextField
                print("Janardhan-",firstTextField.text as Any);
                
            }
            
            
            //print("firstName \(String(describing: firstTextField.text)), secondName \(String(describing: secondTextField.text))")
        }
        if message=="Forgot"{
            
            alertController.addTextField {
                (textField:UITextField) in
                textField.placeholder="Enter Email-Id"
            }
        }
        
        alertController.addAction(Cancel)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
