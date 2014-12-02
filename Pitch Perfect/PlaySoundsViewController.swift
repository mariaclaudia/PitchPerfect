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
    var receiveAudio: RecorderAudio! //variable created in order to store the audio from RecordSoundController
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
//                var filePathNSURL = NSURL.fileURLWithPath(filePath)
//                //also: NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")
//            
//        }else  {println("The filepath is empty");}
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receiveAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receiveAudio.filePathUrl, error: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(1000)

    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)

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
    
    //New Function
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
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
