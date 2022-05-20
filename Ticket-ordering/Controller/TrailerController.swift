//
//  TrailerController.swift
//  Ticket-ordering
//
//  Created by KEFAN CHEN on 18/5/2022.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
class TrailerController: UIViewController {
    var url = ""
    @IBOutlet var playerView: UIView!
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    // add defualt page
    override func viewDidLoad() {
        super.viewDidLoad()
        if url != "no"{
            LoadVideo()
        }
    }
    func LoadVideo() {
        guard let videoURL = URL(string: url) else {
            print("something")
            return
        }
        self.player = AVPlayer(url: videoURL)
        self.playerViewController = AVPlayerViewController()
        playerViewController.player = self.player
        playerViewController.view.frame = self.playerView.frame
        playerViewController.player?.pause()
        self.playerView.addSubview(playerViewController.view)
    }
}
