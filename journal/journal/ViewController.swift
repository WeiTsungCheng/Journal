//
//  ViewController.swift
//  journal
//
//  Created by Wei-Tsung Cheng on 2017/8/4.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var tableView: UITableView!
    
    var destinationArray = [String]()
    var dataArray = [Data]()


    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = UserDefaults.standard

//        print(destinationArray)
//        userDefaults.removeObject(forKey: "info")

       print(destinationArray)

        if let locations = userDefaults.object(forKey: "info") as? [String] {
 print("〽️〽️〽️〽️〽️")
            destinationArray = locations
 print("〽️〽️〽️〽️〽️")
            }


        if let photos = userDefaults.object(forKey: "photo") as? [Data] {

                

                    dataArray = photos
 print("〽️")
                print(dataArray)
                    
 print("〽️")


        }





    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return destinationArray.count
    }

//swiftlint:disable force_cast

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
// swiftlint:enable force_cast

        cell.locationName.text = destinationArray[indexPath.row]

//        cell.presentPhoto.image = UIImage(data: dataArray[indexPath.row])


        return cell
    }






}
