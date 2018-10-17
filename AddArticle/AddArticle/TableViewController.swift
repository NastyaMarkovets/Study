//
//  TableViewController.swift
//  AddArticle
//
//  Created by Alexandr Yanski on 12.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

struct cellData {
    let date: String!
    let text: String!
    let image: UIImage!
}

class TableViewController: UITableViewController, PassDataDelegate {

    var array = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        array = [cellData(date: "September 15, 2015", text: "Alex Yanski", image: UIImage(named: "AppIcon")),
                 cellData(date: "April 16, 2017", text: "Elena Markovets", image: UIImage(named: "AppIcon")),
                 cellData(date: "December 17, 2018", text: "Nadya Cherepaha", image: UIImage(named: "AppIcon"))]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.delegate = self
        }
    }
    
    func passData(value: cellData) {
        array.append(value)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ArticleCell", owner: self, options: nil)?.first as! ArticleCell
        cell.dateLabel.text = array[indexPath.row].date
        cell.articleImage.image = array[indexPath.row].image
        cell.articleDescription.text = array[indexPath.row].text
        cell.articleImage.layer.cornerRadius = cell.articleImage.bounds.size.width / 4.0
        cell.articleImage.clipsToBounds = true
        cell.articleDescription.sizeToFit()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
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
