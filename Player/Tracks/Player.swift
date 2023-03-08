//
//  Player.swift
//  Player
//
//  Created by Евгений Таракин on 07.03.2023.
//

import Foundation
import MediaPlayer

final class Player {
    
//    MARK: - property
    static let shared = Player()
    private var player: AVPlayer!
    private lazy var chooseIndexTrack: Int? = nil
    var isPlaying: Bool = false
    
    let tracks = [Track(author: "DIE ANTWOORD", name: "Cookie Thumper"),
                  Track(author: "Eminem", name: "Mokingbird"),
                  Track(author: "Imagine Dragons", name: "Bones"),
                  Track(author: "Imagine Dragons, JID", name: "Enemy"),
                  Track(author: "The Weeknd", name: "The Hills")
    ]
    
//    MARK: - func
    func turnOnNewTrack(_ indexTrack: Int) {
        if chooseIndexTrack != indexTrack {
            chooseIndexTrack = indexTrack
            guard let chooseIndexTrack = chooseIndexTrack else { return }
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        }
        player.play()
        isPlaying = true
    }
    
    func playTrack() {
        player.play()
        isPlaying = true
    }
    
    func pauseTrack() {
        player.pause()
        isPlaying = false
    }
    
    func turnOnNextTrack() {
        if chooseIndexTrack != 4, chooseIndexTrack != nil {
            self.chooseIndexTrack! += 1
        } else {
            self.chooseIndexTrack = 0
        }
        guard let chooseIndexTrack = chooseIndexTrack else { return }
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        player.play()
        isPlaying = true
    }
    
    func turnOnPreviousTrack() {
        if chooseIndexTrack != 0, chooseIndexTrack != nil {
            self.chooseIndexTrack! -= 1
        } else {
            self.chooseIndexTrack = 4
        }
        guard let chooseIndexTrack = chooseIndexTrack else { return }
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        player.play()
        isPlaying = true
    }
    
    func getIndexTrack() -> Int {
        return chooseIndexTrack ?? 0
    }
    
}
