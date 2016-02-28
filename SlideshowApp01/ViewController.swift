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
    
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn4: UIButton!

    let myImage1 = UIImage(named:"IMG_1061.jpg")
    let myImage2 = UIImage(named:"IMG_2727.jpg")
    let myImage3 = UIImage(named:"IMG_1993.jpg")
    
    //画像のポジションを管理する　０〜２
    var CountPosition:Int = 0
    
    // 自動再生を管理する　true：オート中
    var AoutSwitch:Bool   = false //停止中
    
    //タイマー.
    var timer : NSTimer!
   
    // 拡大ボタンの処理
    @IBAction func Bottan4(sender: AnyObject) {

        //timerが動いてるなら.
        if AoutSwitch == true {
            AoutSwitch = false //オート停止にする
            if timer.valid == true {
                // タイマーを停止する //timerを破棄する.
                timer.invalidate()
            }
            Lavel.text = String(Lavel.text!)+"   停止"
            // ボタン１、ボタン３を有効にする
            self.Btn1.enabled = true
            self.Btn3.enabled = true
            // ボタン２のラベルを変更する
            self.Btn2.setTitle("自動再生", forState: UIControlState.Normal)
        }
    }
    
    // 画面遷移の準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のSecondVewを取得する
        let ssv:SecondVew = segue.destinationViewController as! SecondVew
        // 遷移先のSecondVewで宣言しているzに値を代入して渡す
        ssv.z = CountPosition
    }
    
    @IBAction func Bottan1(sender: AnyObject) {

        if --CountPosition < 0 {
            CountPosition = 2
        }
        self.ImaveSet(CountPosition)
    }

    @IBAction func Bottan2(sender: AnyObject) {

        if AoutSwitch == false{//オート停止中なら
            AoutSwitch = true //オート中にする

            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(
                2,
                target: self,
            selector:Selector("step"),
                userInfo: nil,
                repeats: true)
            
            // ボタン１、ボタン３を無効にする
            self.Btn1.enabled = false
            self.Btn3.enabled = false
            
            // ボタン２のラベルを変更する
            self.Btn2.setTitle("停止", forState: UIControlState.Normal)


        }else{
            AoutSwitch = false //オート停止にする
            
            //timerが動いてるなら.
            if timer.valid == true {
                // タイマーを停止する //timerを破棄する.
                timer.invalidate()
            }

            //Lavel.text = String(Lavel.text!)+"   停止"
            
            // ボタン１、ボタン３を有効にする
            self.Btn1.enabled = true
            self.Btn3.enabled = true
            
            // ボタン２のラベルを変更する
            self.Btn2.setTitle("自動再生", forState: UIControlState.Normal)
            
           self.ImaveSet(CountPosition)
        }
        
    }
    
    @IBAction func Bottan3(sender: AnyObject) {

        if ++CountPosition > 2 {
            CountPosition = 0
        }
        self.ImaveSet(CountPosition)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        // 画像のaspect比を維持し、ちょうどはいるようにする
        ImageVew.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.ImaveSet(CountPosition)
        
        /**  ImageVewをタップ出来るようにする　**/
        self.ImageVew.userInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapImg:")
            // ":"が無いと落ちる。
        self.ImageVew.addGestureRecognizer(myTap)
        /**  ImageVewをタップ出来るようにする　**/

    }
    
    //  画像のタップでの処理
    func tapImg(sender:UITapGestureRecognizer){
        print("tapped AAAAAAAAAAAAAAAA")
        
        //  自動再生中なら、停止にする
        if AoutSwitch == true {
            AoutSwitch = false //オート停止にする
            if timer.valid == true {
                // タイマーを停止する //timerを破棄する.
                timer.invalidate()
            }
            Lavel.text = String(Lavel.text!)+"   停止"
            // ボタン１、ボタン３を有効にする
            self.Btn1.enabled = true
            self.Btn3.enabled = true
            // ボタン２のラベルを変更する
            self.Btn2.setTitle("自動再生", forState: UIControlState.Normal)
        }
        
        
        //  SecondVewのzにCountPositionをセットする
        //
        //let ssv:SecondVew = nextbord.destinationViewController as! SecondVew
        //
        //ssv.z = CountPosition
        
        
        //①
        let aaa = self.storyboard!.instantiateViewControllerWithIdentifier( "nextbord" )
            // "nextbord"は、SecondVewのStoryBord ID
        
        //aaa. = CountPosition
        
        // ②
        self.presentViewController( aaa, animated: true, completion: nil)
        
        print("tapped ZZZZZZZZZZZZZZZZ")
    }
    
    // CountPositionを渡すために　追加
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.count = CountPosition
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // タイマーから定期的に呼び出されるメソッド
    func step(){
        if ++CountPosition > 2 {
            CountPosition = 0
        }
        
        self.ImaveSet(CountPosition)
        Lavel.text = String(Lavel.text!)+"  自動再生中"
    }

    
    //  表示する画像のセットする
    func ImaveSet( count:Int ){
        
        switch(count){
        case 0:
            ImageVew.image = myImage1
        case 1:
            ImageVew.image = myImage2
        case 2:
            ImageVew.image = myImage3
        default: break
        }
        Lavel.text = "画像番号"+String(CountPosition)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        self.ImaveSet(CountPosition)
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

