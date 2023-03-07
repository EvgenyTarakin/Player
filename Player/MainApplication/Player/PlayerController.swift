//
//  PlayerController.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit
import MediaPlayer

final class PlayerController: UIViewController {
    
//    MARK: - property
    private lazy var player = AVPlayer()
    
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
    func configuratePlayer() {
        
    }
    
}

extension PlayerController: PlayerViewDelegate {
    func didSelectCloseButton() {
        dismiss(animated: true)
    }
}
