//
//  TableViewController.swift
//  Skeleton
//
//  Created by JingyiZhang on 12/11/17.
//  Copyright © 2017 jz. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var Year = [String]()
    var Export = [String]()
    var Import = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testdata()
        testquery()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Year.count
    }
    
    func testdata(){
        
        let US = Test1()
        US.Year = "2000"
        US.M = 49586
        US.Z = 94856
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(US)
            print("Added \(US.Year) to realm")
        }
    }

    func testquery(){
        
        let realm = try! Realm()
        
        let alldata = realm.objects(Test1.self)
        //alldata.count
        print("testing data")
        for i in alldata{
            Year.append("Year: \(i.Year)")
            Import.append("Import: $\(i.M)")
            Export.append("Export: $\(i.Z)")
            
            print("year \(i.Year) import \(i.M) export \(i.Z)")
            
            tableView.reloadData()
        }
        
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        
        cell.YearLabel.text = Year[indexPath.row]
        cell.SubLabel.text = "\(Import[indexPath.row]), \(Export[indexPath.row])"
        

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
