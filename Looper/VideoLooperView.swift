//
//  VideoLooperView.swift
//  Looper
//
//  Created by Vitaly Berg on 7/20/21.
//  Copyright © 2021 Vitaly Berg. All rights reserved.
//

import UIKit
import AVFoundation

class VideoLooperView: UIView {
    @IBInspectable var videoName: String?
    
    // MARK: - Player
    
    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
    private var player: AVQueuePlayer!
    private var playerLooper: AVPlayerLooper!
    private var playerItem: AVPlayerItem!
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        player = AVQueuePlayer()
        playerLayer.videoGravity = .resizeAspect
        playerLayer.player = player
        
        if let video = videoName, let url = Bundle.main.url(forResource: video, withExtension: nil) {
            playerItem = AVPlayerItem(url: url)
            playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        }
    }
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}
