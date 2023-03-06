//
//  PlayerController.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

final class PlayerController: UIViewController {

//    MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
//    MARK: - private func
    private func commonInit() {
        setBackgroundColor()
    }
    
}
