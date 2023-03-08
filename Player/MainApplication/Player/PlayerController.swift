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
        
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playerView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
//    MARK: - func
    func configurate(_ indexTrack: Int) {
        player.turnOnNewTrack(indexTrack)
        playerView.configurate(name: player.tracks[indexTrack].name, author: player.tracks[indexTrack].author, time: "00:00")
        playerView.changeStatePlayButton(player.isPlaying)
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
        playerView.configurate(name: player.tracks[player.getIndexTrack()].name, author: player.tracks[player.getIndexTrack()].author, time: "00:00")
        playerView.changeStatePlayButton(player.isPlaying)
    }
    
    func didSelectNextButton() {
        player.turnOnNextTrack()
        playerView.configurate(name: player.tracks[player.getIndexTrack()].name, author: player.tracks[player.getIndexTrack()].author, time: "00:00")
        playerView.changeStatePlayButton(player.isPlaying)
    }
}
