//
//  Model.swift
//  ChatView
//
//  Created by Akshatha on 14/03/23.
//

import Foundation

enum SenderType {
    case SENDER
    case RECEIVER
}

class MessageModel {
    var senderName: String = ""
    var message: String
    var senderType: SenderType
    var time: String
    init(senderName: String, message: String, senderType: SenderType, time: String) {
        self.senderName = senderName
        self.message = message
        self.senderType = senderType
        self.time = time
    }
}
