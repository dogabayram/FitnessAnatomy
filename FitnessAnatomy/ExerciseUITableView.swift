//
//  ExerciseUITableView.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 4.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import SDWebImage
import GoogleMobileAds
import MobileCoreServices


struct Model {
    var exerciseName = ""
    var exerciseInfo = ""
}




class ExerciseUITableView: UIViewController,UITableViewDelegate, UITableViewDataSource,GADBannerViewDelegate ,GADInterstitialDelegate{
   
    
    var modelArray = [Model]()
    var exerciseNameArray = [String]()
    var exerciseNameInfoArray = [String]()
    var exerciseNameImageArray = [UIImage]()
    var interstitial: GADInterstitial!

    
    
    var newStringImage = [String]()
    
    
    var row = 0
    var counter = 1
    var exerciseNameFromCollectionView = ""
    

    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self
        
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self

        
        
        
        interstitial = createAndLoadInterstitial()

        
        
        
   // getData(exerciseName: exerciseNameFromCollectionView)
        
      
        getData(exerciseName: exerciseNameFromCollectionView) { (success) in
            if success{
                
              
                
                for i in 1...self.exerciseNameArray.count {
                    self.exerciseNameImageArray.append(UIImage(named: "\(self.exerciseNameFromCollectionView)\(i).jpg")!)

                }
                self.tableView.reloadData()
               
        }
            
            
        }
        

 
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseNameArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! TableViewCell
        
       
        
        cell.exerciseName.text = exerciseNameArray[indexPath.row]
        cell.exerciseImage.image = exerciseNameImageArray[indexPath.row]
        
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if counter > 3 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                counter = 1
                interstitial = createAndLoadInterstitial()
            }
        } else {
            counter += 1
            
            interstitial = createAndLoadInterstitial()
            
        }
        
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let destVC = segue.destination as? DetailsViewController
        destVC?.newImage = exerciseNameImageArray[row]
        destVC?.title = exerciseNameArray[row]
        destVC?.infoText = exerciseNameInfoArray[row]
       
    }
    
    
    
    func getData(exerciseName : String,completion:@escaping ((Bool) -> Void)) {

      
      // let myGroup = DispatchGroup()
    
        Database.database().reference().child("\(exerciseName)Exercises").observe(.value) { (snapshot) in

            for child in snapshot.children {
                let c = child as! DataSnapshot
                let dict = c.value as? [String : AnyObject]
                self.exerciseNameArray.append(dict!["exerciseName"] as! String)
                self.exerciseNameInfoArray.append(dict!["exerciseInfo"] as! String)
                //print(dict!["exerciseName"] as! String)
            }
            
            completion(true)
            
            
   
            }
 
       
        }
      

        
    }
    
    
   
        
        
        
    
        

   

