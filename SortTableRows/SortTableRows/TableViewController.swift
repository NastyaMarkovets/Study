//
//  TableViewController.swift
//  project13
//
//  Created by Alexandr Yanski on 05.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var movies = ["The Seven Samurai", "Bonnie and Clyde", "Reservoir Dogs", "Airplane!", "Pan's Labyrinth", "Doctor Zhivago", "The Deer Hunter", "Close Encounters of the Third Kind", "Up", "Rocky", "Memento", "Braveheart", "Slumdog Millionaire", "The Lord of the Rings: The Return of the King", "Beauty and the Beast", "Seven", "Inception", "Die Hard", "Amadeus", "On the Waterfront", "Wall-E", "Ghostbusters", "Brokeback Mountain", "Blazing Saddles", "Young Frankenstein", "Almost Famous", "Vertigo", "Gladiator", "Avatar", "The Lion King", "Raging Bull", "Mary Poppins", "Amelie", "Alien"]
    let sections = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var dividedArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in sections{
            let dummyArray: NSMutableArray = []
            for j in movies{
                if  i.first!  == j.first! {
                    dummyArray.add(j)
                }
            }
            dividedArray.add(dummyArray)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (dividedArray[section] as! NSMutableArray).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dummyArray = dividedArray[indexPath.section] as! NSMutableArray
        cell.textLabel?.text = dummyArray[indexPath.row] as? String
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sections
    }
    
    internal override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section] as String
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (dividedArray[section] as? NSMutableArray)?.count == 0 {
            return 0
        } else {
            return 44
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
