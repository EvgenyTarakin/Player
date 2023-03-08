//
//  Track.swift
//  Player
//
//  Created by Евгений Таракин on 07.03.2023.
//

import Foundation

final class Track {
    
//    MARK: - property
    let author: String
    let name: String
    var time: Double
    var stringTime: String
    
//    MARK: - init
    init(author: String, name: String, time: Double = 0.0, stringTime: String = "00:00") {
        self.author = author
        self.name = name
        self.time = time
        self.stringTime = stringTime
    }
    
//    MARK: - func
    func getStringTime(_ timeTrack: Double) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        let formattedTime = formatter.string(from: TimeInterval(timeTrack)) ?? ""
        stringTime = formattedTime
    }
    
    
}
