//
//  secondController.swift
//  SampleSwift
//
//  Created by apple on 17/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class secondController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
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
        
        
    
       
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white;        self.view.addSubview(myCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

   
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


