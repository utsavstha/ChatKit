//
//  Messages.swift
//  UITest
//
//  Created by Mac on 12/7/18.
//  Copyright © 2018 Qpay. All rights reserved.
//

import UIKit
struct ChatMessages {
    let text: String
    let isIncoming: Bool
    let date: Date
}
extension Date{
    static func dateFromCustomString(customString: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
class Messages: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    fileprivate let cellID = "id"
    
    let chatMessages = [
        [ChatMessages(text: "Heres my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
         ChatMessages(text: "Iam going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "08/03/2018"))],
        [ChatMessages(text: "Iam going to message another long message that will word wrap,Iam going to message another long message that will word wrap, Iam going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/04/2018")),
         ChatMessages(text: "Yo dawgg!!", isIncoming: true, date: Date.dateFromCustomString(customString: "08/04/2018"))],
        [ChatMessages(text: "Yo dawgg!!, Yo dawgg!!, Yo dawgg!!, Yo dawgg!!", isIncoming: true, date: Date.dateFromCustomString(customString: "08/05/2018")),
         ChatMessages(text: "Iam going to message another long message that will word wrap,Iam going to message another long message that will word wrap, Iam going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/05/2018")),
         ChatMessages(text: "Yo dawgg!!", isIncoming: true, date: Date.dateFromCustomString(customString: "08/05/2018"))]
    ]
    let contactsTableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        view.addSubview(contactsTableView)
        
        contactsTableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
        contactsTableView.separatorStyle = .none
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
     //   cell.messageLabel.text = chatMessages[indexPath.item].text
        cell.chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let firstMessageInSection = chatMessages[section].first{
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd/yyyy"
//            let dateString = dateFormatter.string(from: firstMessageInSection.date)
//            return dateString
//        }
//        return "Section \(Date())"
//    }
    
    class DateHeaderLabel: UILabel {
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = DateHeaderLabel()
        label.backgroundColor = .black
        if let firstMessageInSection = chatMessages[section].first{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            label.text = dateString
            label.textColor = .white
            label.textAlignment = .center
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            label.font = UIFont.boldSystemFont(ofSize: 14)
            return containerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}
