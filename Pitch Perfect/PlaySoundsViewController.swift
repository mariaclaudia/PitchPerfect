//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mary on 25/11/14.
//  Copyright (c) 2014 Mary. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
                var filePathNSURL = NSURL.fileURLWithPath(filePath)
                //also: NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")
                audioPlayer = AVAudioPlayer(contentsOfURL: filePathNSURL, error: nil)
                audioPlayer.enableRate = true
       
        }else  {println("The filepath is empty");}
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
            audioPlayer.stop()
            audioPlayer.rate=0.5
            audioPlayer.currentTime=0
            audioPlayer.play()

    }
    
    
    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate=1.5
        audioPlayer.currentTime=0
        audioPlayer.play()
    
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
    
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}