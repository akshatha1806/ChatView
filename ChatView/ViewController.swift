//
//  ViewController.swift
//  ChatView
//
//  Created by Akshatha on 14/03/23.
//

import UIKit
import IQKeyboardManagerSwift
import IHKeyboardAvoiding

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMessageView: UIView!
    @IBOutlet weak var sendMessageTextView: UITextView!
    @IBOutlet weak var typeMessageLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var sendMessageButtonWidth: NSLayoutConstraint!
    var messageList = [MessageModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getTheMessageList()
        keyBoardStyling()
        applyStyling()
        // Do any additional setup after loading the view.
    }
    // Send Message View styling Method
    func applyStyling() {
        sendMessageView.layer.cornerRadius = 6
        sendMessageView.clipsToBounds = true
        sendMessageTextView.delegate = self
        sendMessageButton.layer.cornerRadius = 6
    }
    // Keyboard styling Method
    func keyBoardStyling() {
        KeyboardAvoiding.avoidingView = self.sendMessageView
        KeyboardAvoiding.padding = 0
    }
    // Setting Up TableView
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi))
    }
    // get the date
    func getTimeStringFromUTC() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    // Create Message List Staticallly
    func getTheMessageList() {
        messageList.append(MessageModel.init(senderName: "Customer", message: "Hi, Hello", senderType: .RECEIVER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Me", message: "Hi, Hello Good morning", senderType: .SENDER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Customer", message: "How are you", senderType: .RECEIVER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Me", message: "I am fine", senderType: .SENDER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Customer", message: "Good", senderType: .RECEIVER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Me", message: "How are you", senderType: .SENDER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Customer", message: "Hi, Hello", senderType: .RECEIVER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Me", message: "Hi, Hello Good morning", senderType: .SENDER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Customer", message: "How are you", senderType: .RECEIVER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Me", message: "I am fine", senderType: .SENDER, time: getTimeStringFromUTC()))
        messageList.append(MessageModel.init(senderName: "Customer", message: "Good", senderType: .RECEIVER, time: getTimeStringFromUTC()))
    }
}
// MARK: Tableview Datasource and Delegate methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messageList[indexPath.row].senderType == .RECEIVER {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ReceiverTableViewCell") as? ReceiverTableViewCell else {
                return UITableViewCell()
            }
            cell.senderTypeLabel.text = messageList.reversed()[indexPath.row].senderName
            cell.messageLabel.text =  messageList.reversed()[indexPath.row].message
            cell.dateLabel.text =  messageList.reversed()[indexPath.row].time
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "SenderTableViewCell") as? SenderTableViewCell else {
                return UITableViewCell()
            }
            cell.senderTypeLabel.text =  messageList.reversed()[indexPath.row].senderName
            cell.messageLabel.text =  messageList.reversed()[indexPath.row].message
            cell.dateLabel.text =  messageList.reversed()[indexPath.row].time
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            cell.selectionStyle = .none
            return cell
        }
    }
}
// MARK: TextView Delegate method
extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView == sendMessageTextView {
            if textView.text == "" {
                self.typeMessageLabel.isHidden = false
                sendMessageButtonWidth.constant = 0
                sendMessageButton.isHidden = true
            } else {
                self.typeMessageLabel.isHidden = true
                sendMessageButtonWidth.constant = 50
                sendMessageButton.isHidden = false
                sendMessageButton.isUserInteractionEnabled = true
            }
        }
    }
}
