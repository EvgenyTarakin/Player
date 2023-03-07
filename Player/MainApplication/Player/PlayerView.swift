//
//  PlayerView.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

// MARK: - protocol
protocol PlayerViewDelegate: AnyObject {
    func didSelectCloseButton()
}

final class PlayerView: UIView {

//    MARK: - property
    weak var delegate: PlayerViewDelegate?
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(.init(systemName: "multiply"), for: .normal)
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [namesStackView, timesStackView])
        stackView.setupStackViewParameters(axis: .vertical, spacing: 32, distribution: .fillEqually)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var namesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTrackLabel, nameAuthorLabel])
        stackView.setupStackViewParameters(axis: .vertical, spacing: 8, distribution: .fillProportionally)
        
        return stackView
    }()
    
    private lazy var nameTrackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelParameters(text: "NAME", size: 20, textAligment: .center)
        
        return label
    }()
    
    private lazy var nameAuthorLabel: UILabel = {
        let label = UILabel()
        label.setupLabelParameters(text: "Author", size: 16, textAligment: .center)
        
        return label
    }()
    
    private lazy var timesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeLabelsStackView, slider])
        stackView.setupStackViewParameters(axis: .vertical, spacing: 8, distribution: .fillEqually)
        
        return stackView
    }()
    
    private lazy var timeLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timerLabel, timeTrackLabel])
        stackView.setupStackViewParameters(axis: .horizontal, distribution: .fillEqually)
        
        return stackView
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.setupLabelParameters(text: "00:00", size: 14, textAligment: .left)

        return label
    }()
    
    private lazy var timeTrackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelParameters(text: "00:00", size: 14, textAligment: .right)
        
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(), for: .normal)
        
        return slider
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [previousButton, playButton, nextButton])
        stackView.setupStackViewParameters(axis: .horizontal, spacing: 8, distribution: .fillEqually)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(systemName: "backward.end"), for: .normal)
        button.imageView?.scalesLargeContentImage = true
        
        return button
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(systemName: "play"), for: .normal)
        
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(systemName: "forward.end"), for: .normal)
        
        return button
    }()
    
//    MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    MARK: - private func
    private func commonInit() {
        addSubview(closeButton)
        addSubview(mainStackView)
        addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.leftAnchor.constraint(equalTo: leftAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 56),
            closeButton.widthAnchor.constraint(equalToConstant: 100),
            
            mainStackView.topAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            mainStackView.heightAnchor.constraint(equalToConstant: 150),
            
            buttonsStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 32),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 54),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
//    MARK: - obj-c
    @objc private func tapCloseButton() {
        delegate?.didSelectCloseButton()
    }

}
