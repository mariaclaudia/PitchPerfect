//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mary on 20/11/14.
//  Copyright (c) 2014 Mary. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
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
        //recordButton.enabled = true;
        stopButton.hidden = true;
        
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        stopButton.hidden = false;
        recordingInProgress.hidden = false;
        recordButton.enabled=false;
        //TODO: Record the user voice
        
        println("Recording Audio");
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordingInProgress.hidden=true;
        //stopButton.hidden=true;
    }
}

