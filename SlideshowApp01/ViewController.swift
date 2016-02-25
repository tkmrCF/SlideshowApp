//
//  ViewController.swift
//  SlideshowApp01
//
//  Created by 株式会社コアファイン on 2016/02/25.
//  Copyright © 2016年 eiichi.takamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Lavel: UILabel!
    
    @IBOutlet weak var ImageVew: UIImageView!
    
        let myImage1 = UIImage(named:"IMG_1061.jpg")
        let myImage2 = UIImage(named:"IMG_2727.jpg")
        let myImage3 = UIImage(named:"IMG_1993.jpg")
    var CountPosition:Int = 1
    var AoutSwitch:Bool   = false
    
    
    @IBAction func Bottan1(sender: AnyObject) {
        Lavel.text = "OK1"
        ImageVew.image = myImage1
        

        if --CountPosition < 0 {
            CountPosition = 2
        }
        Lavel.text = String(CountPosition)
        
    }

    @IBAction func Bottan2(sender: AnyObject) {
        Lavel.text = "OK2"
        ImageVew.image = myImage2
        
        Lavel.text = String(CountPosition)
        
        if AoutSwitch == false{
            AoutSwitch = true
            Lavel.text = String(CountPosition)+" true"
        }else{
            AoutSwitch = false
            Lavel.text = String(CountPosition)+" false"
        }
    }
    
    @IBAction func Bottan3(sender: AnyObject) {
        Lavel.text = "OK3"
        ImageVew.image = myImage3

        if ++CountPosition > 2 {
            CountPosition = 0
        }
        Lavel.text = String(CountPosition)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
    それでは
    ①UIImageView　と　UIImageについてから解説いたします。
    ・UIImageView
        UIImageViewクラスは、画面上での画像表示を管理するクラスです。
        画面上に画像を表示するときに使用します。
    
        またUIImageViewクラスで画像を使いたいときには、
        ```ImageView.image = sampleImage//sampleImageはUIImage
        ```
        このようにimageViewクラスのimageの値にUIImageを設定して画像を表示します。
    
    
    ・UIImage
    画像を管理するクラスです。
    例えばsample.pngという画像があった場合その画像をアプリ上で使う際には一度UIImageオブジェクトにしてからUIImageViewやボタンに設定する必要がございます。
    
    またおそらくですが画面上に画像が表示されているのでしたら、UIImageではなくUIImageViewを使用して、画像を表示しているかと思われます。
    **/
    
    
    
    

}

