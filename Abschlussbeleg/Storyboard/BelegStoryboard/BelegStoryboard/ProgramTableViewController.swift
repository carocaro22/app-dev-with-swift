//
//  ProgramTableViewController.swift
//  BelegStoryboard
//
//  Created by Med Mohanna on 25.05.21.
//

import UIKit

class ProgramTableViewController: UITableViewController {
    
    var programArray: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadTask = URLSession.shared.downloadTask(with: URL.init(string: "https://www.staff.hs-mittweida.de/~rthomane/grdl_iphone/knftv/broadcasts.php")!) { (location, response, error) in
            if let data = try? Data.init(contentsOf: location!){
                if let programDictionary = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    
                    if let broadcast = programDictionary["events"] as? [String:Any]{
                        self.programArray = (broadcast["knftv"] as! [Any])
                    }
                    
                    
                    DispatchQueue.main.async {
                    self.tableView.reloadData()
                    }
                }
            }
        }
        downloadTask.resume()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return programArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath) as! ProgramTableViewCell
        let index = indexPath.row
        let program = ProgramItem(programDictionary: programArray[index] as! [String:Any])
        // Configure the cell...
        cell.title?.text = program.title!
        cell.details?.text = program.details!
        cell.programDescription?.text = program.description!
        cell.subtitle?.text = program.subtitle!
        
        let url = URL(string: program.iconURL!)
        let data = try! Data(contentsOf: url!)
        cell.programImage?.image = UIImage(data: data)
        

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
