//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 天野智広 on 2019/01/31.
//  Copyright © 2019 天野智広. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var return1: UIButton!
    @IBOutlet weak var moveon1: UIButton!

    @IBOutlet weak var auto1: UIButton!
    
    // 画像の名前の配列
    let imageNameArray = [
        "benjomeshi_boy.png",
        "job_jushinryou_syukin_angry.png",
        "youkai_karakasakozou.png",
        ]
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    
  
    @IBAction func onTapImage(_ sender: Any) {
        //（課題提出後修正）画面遷移する前にタイマーをストップ
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の timer == nil-> timer = nil
            auto1.setTitle("再生", for: UIControl.State.normal) //ボタンを再生に戻す
            return1.isEnabled = true //戻るボタンを有効に戻す
            moveon1.isEnabled = true //進むボタンを有効に戻す
        }
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // ResultViewControllerで宣言しているimageに対して値を代入して渡す
        let image = UIImage(named: String(imageNameArray[dispImageNo]) )
        resultViewController.image = image
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    @objc func nextImage(_ timer: Timer) {
        dispImageNo += 1
        displayImage2()
    }
    
    /// TIMER用_表示している画像の番号を元に画像を表示させる関数定義
    func displayImage2() {
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    @IBAction func moveon2(_ sender: Any) {
        
        // 表示している画像の番号をプラス１
        dispImageNo += 1
        
        // 表示している画像の番号をもとに画像を表示する
        displayImage2()
        
    }
    
    @IBAction func return2(_ sender: Any) {
        
        // 表示している画像の番号をマイナス1
        dispImageNo -= 1
        
        // 表示している画像の番号をもとに画像を表示する
        displayImage2()
        
    }

    
   
    @IBAction func auto2(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
            auto1.setTitle("停止", for: UIControl.State.normal)//ボタンを停止に変更
            return1.isEnabled = false //戻るボタンを無効化
            moveon1.isEnabled = false //進むボタンを無効化
        }
            
        else if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil          // startTimer() の timer == nil-> timer = nil
                auto1.setTitle("再生", for: UIControl.State.normal) //ボタンを再生に戻す
                return1.isEnabled = true //戻るボタンを有効に戻す
                moveon1.isEnabled = true //進むボタンを有効に戻す
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初期画面表示
        let image = UIImage(named: "benjomeshi_boy")
        imageView.image = image

    }
}
