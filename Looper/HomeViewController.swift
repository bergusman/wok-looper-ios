//
//  HomeViewController.swift
//  Looper
//
//  Created by Vitaly Berg on 7/20/21.
//  Copyright © 2021 Vitaly Berg. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var coinView: VideoLooperView!
    @IBOutlet weak var letterView: VideoLooperView!
    @IBOutlet weak var topView: VideoLooperView!
    private var looperViews: [VideoLooperView] = []
    
    private func setup() {
        looperViews = [
            coinView,
            letterView,
            topView
        ]
    }
    
    private func play() {
        for (i, looperView) in self.looperViews.enumerated() {
            if i == segmentedControl.selectedSegmentIndex {
                looperView.play()
            }
        }
    }
    
    private func pause() {
        looperViews.forEach { $0.pause() }
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        for (i, looperView) in self.looperViews.enumerated() {
            if i == sender.selectedSegmentIndex {
                looperView.play()
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.coinView.alpha = sender.selectedSegmentIndex == 0 ? 1 : 0
            self.letterView.alpha = sender.selectedSegmentIndex == 1 ? 1 : 0
            self.topView.alpha = sender.selectedSegmentIndex == 2 ? 1 : 0
        } completion: { (finished) in
            if finished {
                for (i, looperView) in self.looperViews.enumerated() {
                    if i != sender.selectedSegmentIndex {
                        looperView.pause()
                    }
                }
            }
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        pause()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
