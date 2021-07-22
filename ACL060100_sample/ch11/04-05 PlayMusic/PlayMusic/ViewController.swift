//
//  ViewController.swift
//  PlayMusic
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    var audio: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 向訊息中心註冊音樂被電話中斷或中斷恢復時要呼叫的函數
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(audioInterrupted(_:)),
            name: AVAudioSession.interruptionNotification,
            object: nil
        )

        do {
            let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
            try AVAudioSession.sharedInstance().setCategory(.playback)
            audio = try AVAudioPlayer(contentsOf: url!)
            if audio != nil {
                if audio!.prepareToPlay() {
                    print("開始播放音樂")
                    audio!.play()
                    
                    slider.minimumValue = 0
                    slider.maximumValue = Float(audio!.duration)
                    slider.value = 0
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                        self.ticker(timer: timer)
                    }

                }
            }
        } catch {
            print(error)
        }
    }

    @objc func audioInterrupted(_ notification: NSNotification) {
        guard audio != nil, let userInfo = notification.userInfo else {
            return
        }
        
        let type_tmp = userInfo[AVAudioSessionInterruptionTypeKey] as! NSNumber
        let type = AVAudioSession.InterruptionType(rawValue: type_tmp.uintValue)

        switch type! {
        case .began:
            print("音樂中斷")
            
        case .ended:
            print("中斷原因結束")
            
            let option_tmp = userInfo[AVAudioSessionInterruptionOptionKey] as! NSNumber
            let option = AVAudioSession.InterruptionOptions(rawValue: option_tmp.uintValue)

            if option == .shouldResume && audio!.prepareToPlay() {
                audio!.play()
            }
            
        @unknown default:
            break
        }
    }

    func ticker(timer: Timer) {
        slider.value = Float(audio!.currentTime)
        if !audio!.isPlaying {
            print("音樂結束")
            timer.invalidate()
        }
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        audio?.currentTime = Double(slider.value)
    }
}

