//
//  ViewController.swift
//  UITest
//
//  Created by Mac on 12/6/18.
//  Copyright © 2018 Qpay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var SIDE_PADDING = 28
    let SCALE = CGFloat(1.08)
    let SCALE_SMALL = CGFloat(1.04)
    let DURATION_SHOW = 0.5
    let DURATION_HIDE = 0.5

    let ALPHA = CGFloat(0.8)
    var constrain: NSLayoutConstraint?
    let imageOne: UIImageView = {
        let image = UIImageView(image: UIImage(named: "my_card_bg"))
        return image
    }()
    let imageTwo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "my_card_2"))
        return image
    }()
    let imageThree: UIImageView = {
        let image = UIImageView(image: UIImage(named: "my_card_3"))
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 238/255, green: 240/241, blue: 241/255, alpha: 1)
        view.addSubview(imageOne)
        view.addSubview(imageTwo)
        view.addSubview(imageThree)
        self.navigationItem.title = "Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        
        imageOne.layer.shadowColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1).cgColor
        imageOne.layer.shadowOpacity = 1
        imageOne.layer.shadowOffset = CGSize.zero
        imageOne.layer.shadowRadius = 3
        
        imageTwo.layer.shadowColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1).cgColor
        imageTwo.layer.shadowOpacity = 1
        imageTwo.layer.shadowOffset = CGSize.zero
        imageTwo.layer.shadowRadius = 3
        
        imageThree.layer.shadowColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1).cgColor
        imageThree.layer.shadowOpacity = 1
        imageThree.layer.shadowOffset = CGSize.zero
        imageThree.layer.shadowRadius = 3

        
        imageOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14).isActive = true
       // imageOne.addConstraint(constrain!)
        imageOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-SIDE_PADDING)).isActive = true
        imageOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(SIDE_PADDING)).isActive = true
        imageOne.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageTwo.translatesAutoresizingMaskIntoConstraints = false
        imageTwo.topAnchor.constraint(equalTo: imageOne.bottomAnchor, constant: -140).isActive = true
        imageTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-SIDE_PADDING)).isActive = true
        imageTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(SIDE_PADDING)).isActive = true
        imageTwo.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageThree.translatesAutoresizingMaskIntoConstraints = false
        imageThree.topAnchor.constraint(equalTo: imageTwo.bottomAnchor, constant: -140).isActive = true
        imageThree.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-SIDE_PADDING)).isActive = true
        imageThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(SIDE_PADDING)).isActive = true
        imageThree.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.imageOne.addTapGestureRecognizer{
            
            self.view.bringSubviewToFront(self.imageThree)
            self.view.bringSubviewToFront(self.imageTwo)
            self.view.bringSubviewToFront(self.imageOne)
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageOne.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DIdentity
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
               
            }, completion: nil)
        }
        
        self.imageTwo.addTapGestureRecognizer{
            

            self.view.bringSubviewToFront(self.imageTwo)
            
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
                self.imageOne.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
               

            }, completion: nil)
            
        }
        
        self.imageThree.addTapGestureRecognizer{
            self.view.bringSubviewToFront(self.imageOne)
            self.view.bringSubviewToFront(self.imageTwo)
            self.view.bringSubviewToFront(self.imageThree)
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
                self.imageOne.layer.transform = CATransform3DIdentity
             

            }, completion: nil)
        }
        

        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
    }
    @objc func handlePan(pan: UIPanGestureRecognizer){
        let location = pan.location(in: view)
        
        if location.y < self.imageOne.frame.maxY {
            self.view.bringSubviewToFront(self.imageThree)
            self.view.bringSubviewToFront(self.imageTwo)
            self.view.bringSubviewToFront(self.imageOne)
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageOne.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DIdentity
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
              
            }, completion: nil)
        }else if location.y > self.imageOne.frame.maxY && location.y < self.imageTwo.frame.maxY {
            self.view.bringSubviewToFront(self.imageTwo)
            
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
                self.imageOne.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
     
                
            }, completion: nil)
        }else if location.y < self.imageThree.frame.maxY && location.y > self.imageTwo.frame.maxY{
            self.view.bringSubviewToFront(self.imageOne)
            self.view.bringSubviewToFront(self.imageTwo)
            self.view.bringSubviewToFront(self.imageThree)
            UIView.animate(withDuration: self.DURATION_SHOW, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageThree.layer.transform = CATransform3DMakeScale(self.SCALE, self.SCALE, self.SCALE)
            }, completion: nil)
            
            UIView.animate(withDuration: self.DURATION_HIDE, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5,options: .curveEaseOut, animations: {
                self.imageTwo.layer.transform = CATransform3DMakeScale(self.SCALE_SMALL, self.SCALE_SMALL, self.SCALE_SMALL)
                self.imageOne.layer.transform = CATransform3DIdentity

                
            }, completion: nil)
        }
    }

}

extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func addDoubleTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tapGestureRecognizer.numberOfTapsRequired = 3
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
}
