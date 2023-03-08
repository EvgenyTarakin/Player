//
//  ViewController.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

final class TrackListController: UIViewController {
    
//    MARK: - property
    private lazy var player = Player.shared
    
    private lazy var trackListView: TrackListView = {
        let trackListView = TrackListView()
        trackListView.delegate = self
        trackListView.configurate(player.tracks)
        trackListView.translatesAutoresizingMaskIntoConstraints = false
        
        return trackListView
    }()
    
//    MARK: - ViewComtroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
//    MARK: - private func
    private func commonInit() {
        setupBackgroundColor()
        player.getTimeTracks()

        view.addSubview(trackListView)
        NSLayoutConstraint.activate([
            trackListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            trackListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            trackListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            trackListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}

// MARK: - extension
extension TrackListController: TrackListViewDelegate {
    func didSelectCell(_ index: Int) {
        let controller = PlayerController()
        controller.configurate(index)
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.large()]
        }
        present(controller, animated: true)
    }
}

