//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Ally Mahmoud on 6/26/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var counter = 0

    @IBOutlet weak var Recordbutton: UIButton!
    @IBOutlet weak var Stopbutton: UIButton!
    //@IBOutlet weak var Playbutton: UIButton!
    
      @IBOutlet weak var hint_text: UILabel!
    
    // 1
    var audioPlayer:AVAudioPlayer!
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Recordbutton.tintColor
        
        
        
        //4
        self.prepareAudioRecorder()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartRecording(_ sender: UIButton) {
        counter += 1
        print("start recording button clicked \(counter)")
        
        if !audioRecorder.isRecording {
            // start recording
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setActive(true)
                audioRecorder.record()
            } catch {
                print(error)
            }
            //hide record buttn and show stop button
            Recordbutton.isHidden = true
            Stopbutton.isHidden = false
            hint_text.text = "Recording..."
        }
   
        
    }
    
    

    @IBAction func Stopbutton(_ sender: Any) {
        
        counter += 1
        print("stop recording button clicked \(counter)")
        
        // stop recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(false)
        } catch {
            print(error)
        }
        hint_text.text = "Press button to record"
        
        // Check to see if audio file exists, if so present play button
        if self.verifyFileExists() {
            print("file exists")
            
            //hide stop button and show play button
            Stopbutton.isHidden = true
            Recordbutton.isHidden = false
            
            self.performSegue(withIdentifier: "playsegue", sender: sender)
            
            
        
            
        } else {
            print("There was a problem recording")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let play_view: PlayViewController = segue.destination as! PlayViewController
        
        play_view.audio_file_location = audioFileLocation()
        
    }
    
    
//    @IBAction func Playbutton(_ sender: Any) {
//        counter += 1
//        print("play recording button clicked \(counter)")
//    }

    
//    @IBAction func Playbutton(_ sender: Any) {
//        counter += 1
//        print("play recording button clicked \(counter)")
//        
//        //play the sudio
//        self.playAudio()
//    }

    // 3
    func prepareAudioRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioRecorder = AVAudioRecorder(url: URL(fileURLWithPath: self.audioFileLocation()), settings: self.audioRecorderSettings())
            audioRecorder.prepareToRecord()
        } catch {
            print(error)
        }
    }
    
    
    
    
    // 2
    // MARK: Helpers
    func audioFileLocation() -> String {
        return NSTemporaryDirectory().appending("audioRecording.m4a")
    }
    
    func audioRecorderSettings() -> [String:Any] {
        let settings = [AVFormatIDKey : NSNumber.init(value: kAudioFormatAppleLossless),
                        AVSampleRateKey : NSNumber.init(value: 44100.0),
                        AVNumberOfChannelsKey : NSNumber.init(value: 1),
                        AVLinearPCMBitDepthKey: NSNumber.init(value: 16),
                        AVEncoderAudioQualityKey : NSNumber.init(value: AVAudioQuality.high.rawValue)]
        return settings
    }
    
    //5
    func verifyFileExists() -> Bool {
        let fileManager = FileManager.default
        
        return fileManager.fileExists(atPath: self.audioFileLocation())
    }
    
    
    
    
}

