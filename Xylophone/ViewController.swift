//
//  ViewController.swift
//  Xylophone
//
//  Created by appsgaga on 2015/11/12.
//  Copyright © 2015年 appsgaga. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //因為有8種音階，所以加入8個為AVAudioPlayer類別的物件
    var player0:AVAudioPlayer?
    var player1:AVAudioPlayer?
    var player2:AVAudioPlayer?
    var player3:AVAudioPlayer?
    var player4:AVAudioPlayer?
    var player5:AVAudioPlayer?
    var player6:AVAudioPlayer?
    var player7:AVAudioPlayer?
    var playerMatrix:[AVAudioPlayer?] = []
    
    
    @IBAction func playSound(sender: UIButton) {//選touchDown的原因是希望一按下就發出聲音
        playerMatrix[sender.tag - 1]?.stop()
        playerMatrix[sender.tag - 1]?.currentTime = 0.0
        
        //接下來為了分辨是哪個按鈕按的，所以幫每個按鈕加上tag標籤
        playerMatrix[sender.tag - 1]?.play()//sender.tag便可以知道按下哪個按鈕。ex若tag=1表示按下第一個button，所以playerMatrix中第0個的player1，便需要播放音檔
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //先把每個player放入到playerMatrix中
        playerMatrix = [player0, player1, player2, player3, player4, player5, player6, player7]
        
        for var i = 0 ; i < playerMatrix.count ; i++ {
            let path = NSBundle.mainBundle().pathForResource("\(i+1)", ofType: "mp3")//依序讀出1.mp3的路徑~8.mp的路徑
            do{
                playerMatrix[i] = try AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(path!))//再用上面找到的檔案路徑生出AVAudioPlayer，在存回playerMatrix的第i個player。依序這樣的方法把每個不同的音檔，依序加入不同的AVAudioPlayer中
            }catch _ {
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

