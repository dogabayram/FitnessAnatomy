//
//  BodyPartsCollectionViewController.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 4.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import UIKit

private let reuseIdentifier = "partOfMuscles"

class BodyPartsCollectionViewController: UICollectionViewController {
    
    
    
    let exerciseImageArray = ["1","2","3","4","5","6"]
    let exerciseNames = ["Shoulder","Chest","Back","Leg","Arm","Abs"]
    var row = 0
    var choosenExercise = ""

    override func viewDidLoad() {
        super.viewDidLoad()


    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return exerciseImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: exerciseImageArray[indexPath.row] + ".png")
        cell.exerciseNameLabel.text = exerciseNames[indexPath.row]
        
        
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        row = indexPath.row
        
        switch row {
        case 0:
            print("Shoulder")
            choosenExercise = "Shoulder"
        case 1:
            print("Chest")
            choosenExercise = "Chest"
        case 2:
            print("Back")
            choosenExercise = "Back"
        case 3:
            print("Leg")
            choosenExercise = "Leg"
        case 4:
            print("Arm")
            choosenExercise = "Arm"
        case 5:
            print("Abs")
            choosenExercise = "Abs"
        default:
            print("Choose Again")
        }
        
        performSegue(withIdentifier: "showExercises", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExercises" {
            
            if let destVC = segue.destination as? ExerciseUITableView {
                
                destVC.exerciseNameFromCollectionView = choosenExercise
                destVC.title = "\(choosenExercise) Exercises"
                
                
            }
            
            
        }
    }


}
