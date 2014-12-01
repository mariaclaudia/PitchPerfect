//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mary on 20/11/14.
//  Copyright (c) 2014 Mary. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
  
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!

    var audioRecorder: AVAudioRecorder!
    var recorderAudio: RecorderAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //Hiding the Stop Button
        recordButton.enabled = true;
        stopButton.hidden = true;
        
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        
        stopButton.hidden = false;
        recordButton.enabled = false;
        recordingInProgress.hidden = false;
       
        //TODO: Record the user voice
        
        println("Recording Audio");
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        
        if (flag){
            //Save the recorded audio
            recorderAudio = RecorderAudio()
            recorderAudio.filePathUrl = recorder.url
            recorderAudio.title = recorder.url.lastPathComponent
            //Move to the next scene Aka perform scene
            self.performSegueWithIdentifier("stopRecording", sender: recorderAudio)
        }else {
            println ("Recording was not succesful")
            recordButton.enabled = true;
            stopButton.hidden = true;

        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording")
        {
        //instanciate the class controller
        let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
            //Retrieve the data and cast as RecorderAudio
            let data = sender as RecorderAudio
            playSoundsVC.receiveAudio = data
         }
    
    }
    @IBAction func stopRecording(sender: UIButton) {
       
        stopButton.hidden=true;
        recordingInProgress.hidden = true;
        
        audioRecorder.stop()
        
        var audioSession = AVAudioSession.sharedInstance()
        
        audioSession.setActive(false, error: nil)

    }
   
}

