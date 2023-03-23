//
//  ReceiverTableViewCell.swift
//  ChatView
//
//  Created by Akshatha on 14/03/23.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
