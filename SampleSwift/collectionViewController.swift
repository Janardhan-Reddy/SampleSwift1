//
//  collectionViewController.swift
//  SampleSwift
//
//  Created by apple on 19/12/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class collectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    let reuseIdentifier = "ColCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) 
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
     //   cell. = "Collections"
        
        let imageV = UIImageView()
        imageV.frame  = CGRect(x: 1, y: 1, width: 98, height: 98)
        imageV.image = UIImage(named: "l4.jpg")
        cell.addSubview(imageV)
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
