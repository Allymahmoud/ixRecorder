//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by Ally Mahmoud on 6/28/17.
//  Copyright © 2017 Ally Mahmoud. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {


    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var slug_button: UIButton!
    @IBOutlet weak var rabbit_button: UIButton!
    
    @IBOutlet weak var squirrel_button: UIButton!
    
    @IBOutlet weak var peacock: UIButton!
    @IBOutlet weak var interference_button: UIButton!
    
    @IBOutlet weak var stop_button: UIButton!
    
    
    var audioPlayer:AVAudioPlayer!
    
    //variable to hold the adudio file location
    var audio_file_location = String()
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play_recorded_sound(_ sender: Any) {
        
        //play audio
        self.playAudio()
    }
    
    @IBAction func slug_play(_ sender: Any) {
    }
    
    @IBAction func rabbit_play(_ sender: Any) {
    }
    
    @IBAction func squirrel_play(_ sender: Any) {
    }
    
    @IBAction func darthvader_play(_ sender: Any) {
    }
    
    
    @IBAction func peacock_play(_ sender: Any) {
    }
    
    @IBAction func interference_play(_ sender: Any) {
    }
    

    @IBAction func stop_action(_ sender: Any) {
    }

    
    
    
    func playAudio() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: self.audio_file_location))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
