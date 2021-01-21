//
//  TableViewController.swift
//  Mp3Player
//
//  Created by Santiago Hidalgo on 21/01/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    let vc = ViewController()
    var listaCancion: [String]!
    var listaPortada: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaCancion = vc.listaCancion
        listaPortada = vc.listaPortada
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaCancion.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listaCancion[indexPath.row]
        
        let portadaCacion = NSURL(fileURLWithPath: Bundle.main.path(forResource: listaCancion[indexPath.row], ofType: "jpg")!)
        let coverData =  NSData(contentsOf: portadaCacion as URL)
        cell.imageView?.image = UIImage(data: coverData! as Data)

        // Configure the cell...

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

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVc: ViewController = segue.destination as! ViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        nextVc.index = indexPath?.row
        
        
    }
    

}
