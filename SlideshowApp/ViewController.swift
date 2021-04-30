//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 阿部俊一 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myimageView: UIImageView!
    @IBOutlet weak var onextbottun: UIButton!
    @IBOutlet weak var obackbottun: UIButton!
    @IBOutlet weak var oplaystopbottun: UIButton!
    
    var timer: Timer! = nil
    var timer_sec: Float = 0
    
    let imageArray: [String] = ["ダウンロード1.jpeg", "ダウンロード2.jpeg", "ダウンロード3.jpeg", "ダウンロード4.jpeg"]
    var imageArrayIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myimageView.image = UIImage(named: imageArray[imageArrayIndex])
    }

    //進むボタンが押された時の処理
    @IBAction func nextbottun(_ sender: Any) {
    //１つ先の画像を表示
        imageArrayIndex += 1
    //最後の時最初を表示
        if imageArrayIndex >= 3 {
            imageArrayIndex = 0
        }
        myimageView.image = UIImage(named: imageArray[imageArrayIndex])
    }
    
    
    //戻るボタンが押された時の処理
    @IBAction func backbutton(_ sender: Any) {
    //１つ前の画像を表示
        imageArrayIndex -= 1
    //最初の時最後を表示
        if imageArrayIndex == -1 {
            imageArrayIndex = 3
        }
        myimageView.image = UIImage(named: imageArray[imageArrayIndex])
    }
    
    //再生停止ボタンが押された時の処理
    @IBAction func playstopbottun(_ sender: Any) {
    //写真が動いてない時
        if timer == nil {
    //タイマーを作る
            timer = Timer.scheduledTimer(timeInterval: 2,
                                         target: self,
                                         selector: #selector(updateTimer(_:)),
                                         userInfo: nil,
                                         repeats: true
    )
     //次へ・戻るボタンをタップ出来なくする
            onextbottun.isEnabled = false
            obackbottun.isEnabled = false
    //再生・停止ボタンの表示を停止にする
            oplaystopbottun.setTitle("停止", for: .normal)
    //写真が動いている時
} else {
    //タイマーを止める
    self.timer.invalidate()
    self.timer = nil
    onextbottun.isEnabled = true
    obackbottun.isEnabled = true
    //再生・停止ボタンの表示を再生にする
    oplaystopbottun.setTitle("再生", for: .normal)
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        imageArrayIndex += 1
        
        //最後の時最初を表示
        if imageArrayIndex >= 3 {
            imageArrayIndex = 0
        }
        myimageView.image = UIImage(named: imageArray[imageArrayIndex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC:ResultViewController = segue.destination as!
            ResultViewController
        
        if timer == nil {
            resultVC.soccer = imageArray[imageArrayIndex]
        } else {
            self.timer.invalidate()
            self.timer = nil
            onextbottun.isEnabled = true
            obackbottun.isEnabled = true
            
            oplaystopbottun.setTitle("再生", for: .normal)
            resultVC.soccer = imageArray[imageArrayIndex]
        }
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

}

