//
//  CellViewTable.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
final class CellViewTable: UITableViewCell {
    var callBackSwitch : (()->Void)? = nil
    lazy var switchBtn: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.isOn = false
        switchBtn.addTarget(self, action: #selector(tapSwicth(sender:)), for: .valueChanged)
        return switchBtn
        
    }()
    
    lazy var title: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "...."
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        super.awakeFromNib()
        self.addSubview(title)
        self.addSubview(switchBtn)
        self.setUpConstraints()
        
    }
    
    @objc func tapSwicth(sender: UISwitch) {
        let isSelected = !self.switchBtn.isSelected
        self.switchBtn.isSelected = isSelected
        if isSelected {
            deselectOtherButton()
        }
        let tableView = self.superview as! UITableView
        _ = tableView.indexPath(for: self)!
        
        self.callBackSwitch!()
    }
    
    func deselectOtherButton() {
        let tableView = self.superview as! UITableView
        let tappedCellIndexPath = tableView.indexPath(for: self)!
        let indexPaths = tableView.indexPathsForVisibleRows
        for indexPath in indexPaths! {
            if indexPath.row != tappedCellIndexPath.row && indexPath.section == tappedCellIndexPath.section {
                let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) as! CellViewTable
                cell.switchBtn.isOn = false
            }
        }
    }
    
    func configure(titulo: String) {
        self.title.text = titulo
    }
    
    func setUpConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 ).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        switchBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3 ).isActive = true
        switchBtn.leftAnchor.constraint(equalTo: title.leftAnchor, constant: 200).isActive = true
        switchBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        switchBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

