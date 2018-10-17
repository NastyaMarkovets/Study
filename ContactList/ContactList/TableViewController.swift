//
//  TableViewController.swift
//  ContactList
//
//  Created by Alexandr Yanski on 10.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

struct cellData {
    let cell: Int!
    let text: String!
    let image: UIImage!
    let list: String!
}

class TableViewController: UITableViewController {
    
    var contactPerson = [cellData]()
    let contactSections = ["FRIENDS", "FAMILY", "COLLEAGUES", "OTHER"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "contactCell")
        
        contactPerson = [cellData(cell: 1, text: "Alex Yanski", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 2, text: "Elena Markovets", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 3, text: "Nadya Cherepaha", image: UIImage(named: "AppIcon"), list: contactSections[0]),
                         cellData(cell: 4, text: "Nikita Rizhik", image: UIImage(named: "AppIcon"), list: contactSections[0]),
                         cellData(cell: 5, text: "Katya Kundikova", image: UIImage(named: "AppIcon"), list: contactSections[0]),
                         cellData(cell: 6, text: "Ilya Kasper", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 7, text: "Viktoriya Kasper", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 8, text: "Anastasia Sologub", image: UIImage(named: "AppIcon"), list: contactSections[2]),
                         cellData(cell: 9, text: "Olga Voinalovich", image: UIImage(named: "AppIcon"), list: contactSections[2]),
                         cellData(cell: 10, text: "Tanya Markovets", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 11, text: "Leonid Markovets", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 12, text: "Alex Rabko", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 13, text: "Valentina Rabko", image: UIImage(named: "AppIcon"), list: contactSections[1]),
                         cellData(cell: 14, text: "Igor Baranski", image: UIImage(named: "AppIcon"), list: contactSections[3]),
                         cellData(cell: 15, text: "Daria Kelpanovich", image: UIImage(named: "AppIcon"), list: contactSections[3]),
                         cellData(cell: 16, text: "Diana Abramchik", image: UIImage(named: "AppIcon"), list: contactSections[3]),
                         cellData(cell: 17, text: "Maria Kyrlovich", image: UIImage(named: "AppIcon"), list: contactSections[3]),]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.contactSections.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var counter = 0

        switch section {
        case 0:
            counter = 0
            for i in self.contactPerson {
                if i.list == contactSections[0] {
                    counter += 1
                }
            }
            return counter
        case 1:
            for i in self.contactPerson {
                if i.list == contactSections[1] {
                    counter += 1
                }
            }
            return counter
        case 2:
            var counter = 0
            for i in self.contactPerson {
                if i.list == contactSections[2] {
                    counter += 1
                }
            }
            return counter
        case 3:
            counter = 0
            for i in self.contactPerson {
                if i.list == contactSections[3] {
                    counter += 1
                }
            }
            return counter
        default:
            return 0
        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        switch indexPath.section {
        case 0:
            if contactPerson[indexPath.row].list == contactSections[0] {
                cell.contactPhotoList.image = contactPerson[indexPath.row].image
                cell.contactLabelList.text = contactPerson[indexPath.row].text
                return cell
            }
        case 1:
            if contactPerson[indexPath.row].list == contactSections[1] {
                cell.contactPhotoList.image = contactPerson[indexPath.row].image
                cell.contactLabelList.text = contactPerson[indexPath.row].text
                return cell
            }
        case 2:
            if contactPerson[indexPath.row].list == contactSections[3] {
                cell.contactPhotoList.image = contactPerson[indexPath.row].image
                cell.contactLabelList.text = contactPerson[indexPath.row].text
                return cell
            }
        case 3:
            if contactPerson[indexPath.row].list == contactSections[3] {
                cell.contactPhotoList.image = contactPerson[indexPath.row].image
                cell.contactLabelList.text = contactPerson[indexPath.row].text
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.contactSections[section] as String
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
