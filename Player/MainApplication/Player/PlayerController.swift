//
//  PlayerController.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

final class PlayerController: UIViewController {
    
//    MARK: - property
    private lazy var player = Player.shared
    
    private lazy var playerView: PlayerView = {
        let playerView = PlayerView()
        playerView.delegate = self
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        return playerView
    }()

//    MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
//    MARK: - private func
    private func commonInit() {
        setupBackgroundColor()
        player.delegate = self
        
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playerView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func turnOnTrack() {
        let track = player.tracks[player.getIndexTrack()]
        playerView.configurate(name: track.name, author: track.author, stringTime: track.stringTime)
        playerView.changeStatePlayButton(player.isPlaying)
    }
    
//    MARK: - func
    func configurate(_ indexTrack: Int) {
        player.turnOnNewTrack(indexTrack)
        turnOnTrack()
    }
    
}

// MARK: - extension
extension PlayerController: PlayerViewDelegate {
    func didSelectCloseButton() {
        dismiss(animated: true)
    }
    
    func didSelectPlayButton() {
        if player.isPlaying {
            player.pauseTrack()
        } else {
            player.playTrack()
        }
        playerView.changeStatePlayButton(player.isPlaying)
    }
    
    func didSelectPreviousButton() {
        player.turnOnPreviousTrack()
        turnOnTrack()
    }
    
    func didSelectNextButton() {
        player.turnOnNextTrack()
        turnOnTrack()
    }
}

extension PlayerController: PlayerDelegate {
    func updateTimer(stringTime: String, time: Float) {
        playerView.updateTimerLabel(stringTime: stringTime, timeSlider: time)
    }
    
    func turnOnNextTrack() {
        didSelectNextButton()
    }
}
