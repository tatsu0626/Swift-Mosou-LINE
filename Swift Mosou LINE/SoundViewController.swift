//
//  SoundViewController.swift
//  Swift Mosou LINE
//
//  Created by 矢部立也 on 2018/01/22.
//  Copyright © 2018年 矢部立也. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var lora: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var imageview2: UIImageView!
    var audioPlayer : AVAudioPlayer!
    var count=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview2.isHidden=true
        
        TimeLabel.isHidden=true
        
        lora.isHidden=true
        
        if let url=Bundle.main.url(forResource:"callMusic",withExtension:"mp3" ){
            do {
                audioPlayer=try AVAudioPlayer(contentsOf:url)
                audioPlayer?.play()
            }catch{
                audioPlayer=nil
            }
        }else{
            fatalError("Url is nil")
        }
        
    }

    @IBAction func Tap(_ sender: Any) {
        imageview2.isHidden=false
        TimeLabel.isHidden=false
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timercountup), userInfo: nil, repeats: true)
        
        
        playbabysound()
        
    }
    
    func playbabysound(){
        if let url=Bundle.main.url(forResource:"baby",withExtension:"mp3" ){
            do {
                audioPlayer=try AVAudioPlayer(contentsOf:url)
                audioPlayer?.play()
            }catch{
                audioPlayer=nil
            }
        }else{
            fatalError("Url is nil")
        }
    }
    
    @objc func timercountup(){
        count=count+1
        TimeLabel.text=String(count)
    }
    @IBAction func Deny(_ sender: Any) {
        
        audioPlayer.stop()
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    
}
