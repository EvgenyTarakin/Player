//
//  TrackListView.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

// MARK: - protocol
protocol TrackListViewDelegate: AnyObject {
    func didSelectCell()
}

final class TrackListView: UIView {
    
//    MARK: - property
    weak var delegate: TrackListViewDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 52
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TrackCell.self, forCellReuseIdentifier: TrackCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

}

// MARK: - extension
extension TrackListView: UITableViewDelegate {
    
}

extension TrackListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseIdentifier, for: indexPath) as? TrackCell else { return UITableViewCell() }
        cell.configurate(name: "name name name name name name name name name", time: "00:00")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCell()
    }
}
