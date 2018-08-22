//
//  secondController.swift
//  SampleSwift
//
//  Created by apple on 17/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class secondController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,URLSessionDelegate
{

    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var cvImages: UICollectionView!
    var arrImages:NSMutableArray = NSMutableArray();
 
    
    
    let reuseIdentifier = "cell"
   
    @IBOutlet weak var Profileimg: UIImageView!
    
    @IBOutlet weak var lblUName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrImages.addObjects(from: ["l3.jpeg","l4.jpg","l3.jpeg","l4.jpg"])
        
        let i = UserDefaults.standard.integer(forKey: "row");
    //    lblUName.text=UserDefaults.standard.string(forKey: "RowValue");
       
       
        
        let name = arrImages.object(at: i)
      
        Profileimg.image=UIImage(named:name as! String );
        self.parseJSON();
//     //   https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22
//        let request = URLRequest(url: URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b6907d289e10d714a6e88b30761fae22")!)
//        //request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            do {
//                let jsonDecoder = JSONDecoder()
//                print(data ?? "nil");
//              let responseModel = try jsonDecoder.decode(GroceryProduct.self, from: data!)
//                print(responseModel)
//            } catch {
//                print("JSON Serialization error")
//            }
//        }).resume()
       
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white;        //self.view.addSubview(myCollectionView)
    }
    func parseJSON()
    {
    

        let sessionConfiguration = URLSessionConfiguration.default
        let urlsession = URLSession.init(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
        
        
        let url = URL(string:"https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22")
        
        let task = urlsession.dataTask(with: url!) {(data, response, error) in
          
            guard error == nil else {
                print("returning error")
                return
            }
            
            guard let content = data else {
                print("not returning data")
                return
            }
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            
            guard let jsonResult = try? JSONDecoder().decode(GroceryProduct.self, from: data!) else{
                return
            }
            print(jsonResult)
          
//print(json);
            if let array = json["username"] {
           //     print("array:",array)
            }
            if let array1 = json["address"]  as? [String:Any] {
                print("array1:",array1["geo"]!)
                if let geoArray = array1["geo"] as?[String:Any]{
                    print("geoArray:", geoArray["lat"]!)
                     print("geoArray:", geoArray["lng"]!)
                }
            }
           
        }
        
        task.resume()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate) {
            completionHandler(.rejectProtectionSpace, nil)
        }
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
struct GroceryProduct: Codable {
    var address: [address]
    var name:String?
    var  username:String?
    var email:String?
    
}
struct address: Codable {
    let geo:[geo]
   
}
struct  geo:Codable {
    var lat:String?
    var lng :String?
    
}
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


