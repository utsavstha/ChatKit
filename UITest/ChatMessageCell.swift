//
//  ChatMessageCell.swift
//  UITest
//
//  Created by Mac on 12/7/18.
//  Copyright © 2018 Qpay. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    var chatMessage: ChatMessages! {
        didSet{
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false

            }else{
                trailingConstraint.isActive = true
                leadingConstraint.isActive = false

            }
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bubbleBackgroundView.backgroundColor = .yellow
        backgroundColor = .clear
        bubbleBackgroundView.layer.cornerRadius = 5
        addSubview(bubbleBackgroundView)
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(messageLabel)
        messageLabel.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor , constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)


        ])
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true

    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
