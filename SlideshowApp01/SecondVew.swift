//
//  SecondVew.swift
//  SlideshowApp01
//
//  Created by 株式会社コアファイン on 2016/02/28.
//  Copyright © 2016年 eiichi.takamura. All rights reserved.
//

import UIKit

let myImage1 = UIImage(named:"IMG_1061.jpg")
let myImage2 = UIImage(named:"IMG_2727.jpg")
let myImage3 = UIImage(named:"IMG_1993.jpg")


class SecondVew: UIViewController {
    
    var z = 0

    @IBOutlet weak var Btn201: UIButton!
    @IBOutlet weak var ImageView201: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //super.viewDidDisappear(animated)
        //let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //z = appDelegate.count!
            /* こっちではNG */
        
        ImageView201.contentMode = UIViewContentMode.ScaleAspectFit
        
        /*　viewDidLoadから下記を削除
        print( z )
        print("tapped BBBBBBBBBB")

        ImageView201.contentMode = UIViewContentMode.ScaleAspectFit
        
        print("tapped CCCCCCCCCC")
        
        switch(z){
        case 0:
            ImageView201.image = myImage1
        case 1:
            ImageView201.image = myImage2
        case 2:
            ImageView201.image = myImage3
        default: break
        }
        */
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("tapped WWWWWWW")
        super.viewDidDisappear(animated)
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        z = appDelegate.count!
        print( z )
        
        // こちらを後から追加した。
        switch(z){
        case 0:
            ImageView201.image = myImage1
        case 1:
            ImageView201.image = myImage2
        case 2:
            ImageView201.image = myImage3
        default: break
        }
    }
    
    @IBAction func Bottan201(sender: AnyObject) {
    }
    
 
}
