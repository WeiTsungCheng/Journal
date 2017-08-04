//
//  SetPhotoViewController.swift
//  journal
//
//  Created by Wei-Tsung Cheng on 2017/8/4.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class SetPhotoViewController: UIViewController {



    @IBOutlet weak var setPhoto: UIImageView!



    func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController


        }


    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))

        // add it to the image view;
        setPhoto.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        setPhoto.isUserInteractionEnabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
