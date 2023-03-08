//
//  Player.swift
//  Player
//
//  Created by Евгений Таракин on 07.03.2023.
//

import Foundation
import MediaPlayer

// MARK: - protocol
protocol PlayerDelegate: AnyObject {
    func updateTimer(stringTime: String, time: Float)
    func turnOnNextTrack()
}

final class Player {
    
//    MARK: - property
    static let shared = Player()
    private var player: AVPlayer!
    private lazy var chooseIndexTrack: Int? = nil
    var isPlaying: Bool = false
    weak var delegate: PlayerDelegate?
    private var timeObserver: Any!
    private var timer: Float = 0.0
    
    let tracks = [Track(author: "DIE ANTWOORD", name: "Cookie Thumper"),
                  Track(author: "Eminem", name: "Mokingbird"),
                  Track(author: "Imagine Dragons", name: "Bones"),
                  Track(author: "Imagine Dragons, JID", name: "Enemy"),
                  Track(author: "The Weeknd", name: "The Hills")
    ]
    
//    MARK: - private func
    private func addTimeObserver() {
        timeObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self] time in
            if isPlaying {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.zeroFormattingBehavior = .pad
                let formattedTime = formatter.string(from: time.seconds)
                timer = Float(time.seconds / tracks[chooseIndexTrack ?? 0].time)
                delegate?.updateTimer(stringTime: "\(formattedTime ?? "")", time: timer)
                if formattedTime == tracks[getIndexTrack()].stringTime {
                    delegate?.turnOnNextTrack()
                }
            }
        }
    }
    
    private func removeTimeObserver() {
        if let observer = timeObserver {
            timer = 0.0
            player.removeTimeObserver(observer)
            timeObserver = nil
        }
    }
    
//    MARK: - func
    func turnOnNewTrack(_ indexTrack: Int) {
        removeTimeObserver()
        if chooseIndexTrack != indexTrack {
            chooseIndexTrack = indexTrack
            guard let chooseIndexTrack = chooseIndexTrack else { return }
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        }
        playTrack()
        addTimeObserver()
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
        if chooseIndexTrack != (tracks.count - 1), chooseIndexTrack != nil {
            self.chooseIndexTrack! += 1
        } else {
            self.chooseIndexTrack = 0
        }
        guard let chooseIndexTrack = chooseIndexTrack else { return }
        removeTimeObserver()
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        playTrack()
        addTimeObserver()
    }

    func turnOnPreviousTrack() {
        if chooseIndexTrack != 0, chooseIndexTrack != nil {
            self.chooseIndexTrack! -= 1
        } else {
            self.chooseIndexTrack = (tracks.count - 1)
        }
        guard let chooseIndexTrack = chooseIndexTrack else { return }
        removeTimeObserver()
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[chooseIndexTrack].author + " - " + tracks[chooseIndexTrack].name, ofType: "mp3")!))
        playTrack()
        addTimeObserver()
    }
    
    func getIndexTrack() -> Int {
        return chooseIndexTrack ?? 0
    }
    
    func getTimeTracks() {
        for index in 0...(tracks.count - 1) {
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: tracks[index].author + " - " + tracks[index].name, ofType: "mp3")!))
            tracks[index].time = player.currentItem?.asset.duration.seconds ?? 0.0
            tracks[index].getStringTime(tracks[index].time)
        }
    }
    
}
