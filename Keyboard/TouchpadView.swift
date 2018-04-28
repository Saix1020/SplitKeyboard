//
//  TouchpadView.swift
//  Keyboard
//
//  Created by saix on 2018/4/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation
import UIKit

class TouchpadView : UIView {
    static let hPadding = CGFloat(16)
    static let vPadding = CGFloat(4)
    static let buttonContainerViewHight = CGFloat(64)
    
    
    var vLine : UIView
    var hLine : UIView
    
    var touchView : UIView
    var buttonContainerView : UIView
    var leftClickButton : UIButton
    var rightClickButton : UIButton
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    func leftButtonClicked() -> Void {
        //self.leftClickButton
    }
    
    override init(frame: CGRect) {
        let leftImage = UIImage(named: "icon_arrow_left")
        let rightImage = UIImage(named: "icon_arrow_right")
        let leftFocImage = UIImage(named: "icon_arrow_left_foc")
        let rightFocImage = UIImage(named: "icon_arrow_right_foc")

        self.vLine = UIView()
        vLine.backgroundColor = UIColor.gray
        vLine.alpha = 0.1
        self.hLine = UIView()
        hLine.backgroundColor = UIColor.gray
        hLine.alpha = 0.1
        self.touchView = UIView()
        self.buttonContainerView = UIView()
        self.leftClickButton = UIButton()
        self.leftClickButton.setImage(leftImage, for: UIControlState.normal)
        self.leftClickButton.setImage(leftFocImage, for: UIControlState.selected)
        self.leftClickButton.setImage(leftFocImage, for: UIControlState.highlighted)

        
        self.rightClickButton = UIButton()
        self.rightClickButton.setImage(rightImage, for: UIControlState.normal)
        self.rightClickButton.setImage(rightFocImage, for: UIControlState.selected)
        self.rightClickButton.setImage(rightFocImage, for: UIControlState.highlighted)

        super.init(frame: frame)
        
        self.addSubview(vLine);
        self.addSubview(touchView);
        self.addSubview(buttonContainerView);
        buttonContainerView.addSubview(leftClickButton);
        buttonContainerView.addSubview(rightClickButton);
        buttonContainerView.addSubview(hLine);
        
        self.leftClickButton.addTarget(self, action:#selector(leftButtonClicked) , for: .touchUpInside)
        let tapGestureRecognizer = UIGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(leftButtonClicked))
        self.touchView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override func layoutSubviews() {
        let bounds = self.bounds;
        let height = bounds.size.height
        let width = bounds.size.width
        vLine.frame = CGRect(x: CGFloat(TouchpadView.hPadding), y: CGFloat(height-TouchpadView.buttonContainerViewHight), width: CGFloat(width-TouchpadView.hPadding*2), height: 1)
        buttonContainerView.frame = CGRect(x: CGFloat(0), y: CGFloat(height-TouchpadView.buttonContainerViewHight), width: width, height: height)
        touchView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: width, height: CGFloat(height-TouchpadView.buttonContainerViewHight))
        
        
        hLine.frame = CGRect(x: CGFloat(width/2), y: CGFloat(0), width: CGFloat(1), height: CGFloat(TouchpadView.buttonContainerViewHight-TouchpadView.vPadding))
        
        leftClickButton.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(width/2), height: TouchpadView.buttonContainerViewHight)
        rightClickButton.frame = CGRect(x: CGFloat(width/2), y: CGFloat(0), width: CGFloat(width/2), height: TouchpadView.buttonContainerViewHight)
        
    }
}
