//
//  LeftViewController.swift
//  UITest
//
//  Created by Mac on 12/30/18.
//  Copyright © 2018 Qpay. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    let topLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "upi_card_thumb")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let priceStackView: UIStackView = {
        let questionPrice = UILabel()
        questionPrice.text = "Question Price"
        
        let price = UILabel()
        price.text = "4.0 $"
        
        let stackView = UIStackView(arrangedSubviews: [questionPrice, price])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let freeQuestionStackView: UIStackView = {
        let questionPrice = UILabel()
        questionPrice.text = "Free Question"
        
        let price = UILabel()
        price.text = "0"
        
        let stackView = UIStackView(arrangedSubviews: [questionPrice, price])
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    struct NavigationView {
        var name: String
        var image: String
        init(name: String, image: String) {
            self.name = name
            self.image = image
        }
    }
    
    var navigationItems = [UIView]()
    fileprivate func getNavigationViews(_ views: [NavigationView]) -> [UIView]{
        var returnViews = [UIView]()
        for v in views{
            let view = UIView()
            let imageView = UIImageView()
            imageView.image = UIImage(named: v.image)
            imageView.contentMode = .scaleAspectFit
            
            let label = UILabel()
            label.text = v.name
            label.textAlignment = .left
            
            view.addSubview(imageView)
            view.addSubview(label)
            
            imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 4, widthConstant: 40)
            
            label.anchor(top: view.topAnchor, left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 4, leftConstant: 18, bottomConstant: 4, rightConstant: 4)
            
            returnViews.append(view)
        }
        
        return returnViews
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
      //  self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        
        //topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, heightConstant: 100)
      //  topView.addSubview(topLogo)
      //  topLogo.anchor(top: topView.topAnchor, left: topView.leftAnchor, right: topView.rightAnchor, topConstant: 14, leftConstant: 14, rightConstant: 14, heightConstant: 60)
        bottomView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        self.bottomView.addSubview(priceStackView)
        self.bottomView.addSubview(freeQuestionStackView)
        
        priceStackView.anchor(top: bottomView.topAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor, leftConstant: 14, heightConstant: 44)
        
        freeQuestionStackView.anchor(top: priceStackView.bottomAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor, leftConstant: 14, heightConstant: 44)
        
       // self.bottomView.addSubview(ourAstrologers)
        
        var navigationViews = [NavigationView]()
        navigationViews.append(NavigationView.init(name: "Our Astrologers", image: "upi_card_thumb"))
        navigationViews.append(NavigationView.init(name: "Your Horoscope", image: "upi_card_thumb"))
        navigationViews.append(NavigationView.init(name: "How Moonsign Works", image: "upi_card_thumb"))
        navigationViews.append(NavigationView.init(name: "Yoga", image: "upi_card_thumb"))
        navigationViews.append(NavigationView.init(name: "Thought of the day", image: "upi_card_thumb"))
        navigationViews.append(NavigationView.init(name: "Customer Support", image: "upi_card_thumb"))

        navigationItems = getNavigationViews(navigationViews)
       
        for (index, item) in navigationItems.enumerated(){
            bottomView.addSubview(item)
            let line = UIView()
            bottomView.addSubview(line)
            line.anchor(top: item.bottomAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor, topConstant: 8, leftConstant: 14, bottomConstant: 8, rightConstant: 14, heightConstant: 1)
            
            if index == 0 {
                item.anchor(top: freeQuestionStackView.bottomAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor, topConstant: 8, leftConstant: 14, heightConstant: 44)
            }else{
                 item.anchor(top: navigationItems[index - 1].bottomAnchor, left: bottomView.leftAnchor, right: bottomView.rightAnchor, topConstant: 14, leftConstant: 14, heightConstant: 44)
            }
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
            item.addGestureRecognizer(tapGestureRecognizer)
            item.isUserInteractionEnabled = true
        }
        
    }
    @objc func tapResponse(_ sender : UIGestureRecognizer) {
        print("imageTapped  indexOf =  \(String(describing: navigationItems.index(of: sender.view!)))")

    }

}
