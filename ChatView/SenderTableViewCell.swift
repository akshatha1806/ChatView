//
//  SenderTableViewCell.swift
//  ChatView
//
//  Created by Akshatha on 14/03/23.
//

import UIKit

class SenderTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
