//
//  ViewController.swift
//  MyMusic
//
//  Created by Rizky Mashudi on 07/05/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  @IBOutlet weak var btnPlay: UIButton!
  @IBOutlet weak var btnStop: UIButton!
  
  private var _player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAudio()
    btnStop.disable()
  }

  @IBAction func didTapPlay(_ sender: Any) {
    guard let player = _player else { return }
    player.play()
    
    btnStop.enable()
    btnPlay.disable()
  }
  
  @IBAction func didTapStop(_ sender: Any) {
    guard let player = _player else { return }
    player.stop()
    
    btnPlay.enable()
    btnStop.disable()
  }
  
  
  private func setupAudio(){
    //Initialize music asset from url
    guard let url = Bundle.main.url(forResource: "afterdark", withExtension: "mp3") else { return }
    
    //Setup AVAudioPlayer
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
}

extension UIButton {
  func enable(){
    self.isEnabled = true
  }
  
  func disable(){
    self.isEnabled = false
  }
}

