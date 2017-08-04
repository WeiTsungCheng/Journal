//
//  SetPhotoViewController.swift
//  journal
//
//  Created by Wei-Tsung Cheng on 2017/8/4.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class SetPhotoViewController: UIViewController {

    var locations = [String]()
    var datas = [Data]()
    var myPhoto = UIImage()

    @IBOutlet weak var writeLocation: UITextField!
    @IBAction func backList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

 var myUserDefaults :UserDefaults!
    @IBOutlet weak var setPhoto: UIImageView!


    @IBAction func saveJournalInfo(_ sender: UIButton) {


        let myUserDefaults = UserDefaults.standard


        self.view.endEditing(true)

        if writeLocation.text != nil {
        locations.append(writeLocation.text!)

        } else {

            return
        }

        myUserDefaults.set(
           locations, forKey: "info")



        let imageData = UIImageJPEGRepresentation(myPhoto, 100)

        print("💠💠💠💠💠💠💠💠💠💠💠💠💠")
        if imageData != nil {
            datas.append(imageData!)

            print(imageData)
            print(datas)
            print("💠💠💠💠💠💠💠💠💠💠💠💠💠")
        } else {
            return
        }


        myUserDefaults.set(imageData, forKey: "photo")
        myUserDefaults.synchronize()

        




    }


    func imageTapped(gesture: UIGestureRecognizer) {

        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")

        }


        let imagePickerController = UIImagePickerController()

        imagePickerController.delegate = self

        let imagePickerAlertController = UIAlertController(title: "上傳圖片", message: "請選擇要上傳的圖片", preferredStyle: .actionSheet)

        let imageFromLibAction = UIAlertAction(title: "照片圖庫", style: .default) { (void) in

            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {

                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let imageFromCameraAction = UIAlertAction(title: "相機", style: .default) { (void) in

            if UIImagePickerController.isSourceTypeAvailable(.camera) {

                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }

        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (void) in

            imagePickerAlertController.dismiss(animated: true, completion: nil)
        }

        imagePickerAlertController.addAction(imageFromLibAction)
        imagePickerAlertController.addAction(imageFromCameraAction)
        imagePickerAlertController.addAction(cancelAction)

        present(imagePickerAlertController, animated: true, completion: nil)

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

    }

}

extension SetPhotoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //取從手機取到的照片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        // 取得從 UIImagePickerController 選擇的檔案
        if let pickedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage {

            setPhoto.image = pickedPhoto
            myPhoto = pickedPhoto
            setPhoto.contentMode = UIViewContentMode.scaleAspectFit

            self.dismiss(animated: true, completion: nil)
        }
        
}
}
