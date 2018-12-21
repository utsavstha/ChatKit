//
//  CardFlipper.swift
//  UITest
//
//  Created by Mac on 12/10/18.
//  Copyright © 2018 Qpay. All rights reserved.
//

import UIKit

class CardFlipper: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let image = UIImageView(image: UIImage(named: "my_card_bg"))
        let image2 = UIImageView(image: UIImage(named: "my_card_2"))
        let image3 = UIImageView(image: UIImage(named: "my_card_3"))
        let image4 = UIImageView(image: UIImage(named: "my_card_bg"))
        let viewOne = UIView()
        viewOne.backgroundColor = .black
        let viewTwo = UIView()
        viewTwo.backgroundColor = .purple
        
        let viewThree = UIView()
        viewThree.backgroundColor = .yellow
        flipView([viewOne, viewTwo, viewThree])
       // self.view.addSubview(image)
        
    }

    func flipView(_ cards: [UIView]){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        
        var incrementConstraint = 0
        var incrementPadding = 14
        for (index, card) in cards.enumerated(){
            self.view.addSubview(card)
            self.view.sendSubviewToBack(card)
            card.isUserInteractionEnabled = true
            card.addGestureRecognizer(tap)

            card.anchor(view)
            let topConstraint = card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14)
            let trailingConstraint = card.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-14))
            let leadingConstraint = card.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(14))
            if index == 1{
                incrementConstraint += 20
            }else{
                incrementConstraint += 20
            }
            if index > 0 {
                print(incrementConstraint)
                topConstraint.constant = CGFloat(incrementConstraint)
                incrementPadding += 4
                trailingConstraint.constant = CGFloat(-incrementPadding)
                leadingConstraint.constant = CGFloat(incrementPadding)

            }
            topConstraint.isActive = true
            trailingConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        
    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        guard let views = sender.view else { return }
       // self.view.bringSubviewToFront(view)
        views.isHidden = true
      //  self.view.bringSubviewToFront(views)
    }
}
extension UIView {
    public func anchor(_ view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
      //   topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14).isActive = true
      //   trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-14)).isActive = true
      //   leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(14)).isActive = true

        heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
