//
//  ViewController.swift
//  IOS8SwiftPlayMusicAVAudioPlayerTutorial
//
//  Created by noprom on 15/7/25.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var trackTitle: UILabel! // 标题
    
    @IBOutlet var playedTime: UILabel! // 播放时间
    
    @IBOutlet var playOrPauseMusic: UIButton! // 播放或者暂停音乐
    
    var audioPlayer = AVAudioPlayer()
    var isPlaying = false
    var timer:NSTimer!
    
    /**
    播放音乐
    
    :param: sender 播放按钮
    */
    @IBAction func playOrPause(sender: AnyObject) {
        if isPlaying{
            audioPlayer.stop()
            isPlaying = false
        }else{
            audioPlayer.play()
            isPlaying = true
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        var currentTime = (Int)audioPlayer.currentTime
        var minutes = currentTime / 60
        var seconds = currentTime - minutes * 60
        
        playedTime.text = NSString(format: "%02d:%02d", minutes, seconds) as String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        trackTitle.text = "Don't Tell Me.mp3"
        var path = NSBundle.mainBundle().URLForResource("Don't Tell Me", withExtension: "mp3")
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: path!, error: &error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

