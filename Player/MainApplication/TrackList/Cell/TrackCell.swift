//
//  TrackCell.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

final class TrackCell: UITableViewCell {
    
//    MARK: - property
    static let reuseIdentifier = String(describing: TrackCell.self)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, timeLabel])
        stackView.spacing = 16
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        return separator
    }()
    
//    MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    MARK: - private func
    private func commonInit() {
        selectionStyle = .gray
        
        addSubview(stackView)
        addSubview(separator)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            timeLabel.widthAnchor.constraint(equalToConstant: 56),
            
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            separator.rightAnchor.constraint(equalTo: rightAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
//    MARK: - func
    func configurate(name: String, time: String) {
        nameLabel.setupLabelParameters(text: name, size: 16)
        timeLabel.setupLabelParameters(text: time, size: 16, textAligment: .right)
    }
    
}
