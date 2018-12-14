//
//  PriorityControl.swift
//  buh
//
//  Created by Пользователь on 14/12/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class PriorityControl: UIView {
    private let controlSize: CGFloat = 30
    private let height: CGFloat = 50
    
    lazy var control: UIView = {
        let view = UIView()
        view.layer.cornerRadius = controlSize/2
        view.backgroundColor = .orange
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        
        
        return view
    }()
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "1"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupControl()
    }
    
    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = height/2
        layer.borderWidth = 2
    }
    
    private func setupControl(){
        addSubview(control)
        control.frame = CGRect(x: 0, y: 0, width: controlSize, height: controlSize)
        control.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        control.addGestureRecognizer(panGesture)
        control.addSubview(valueLabel)
        valueLabel.frame = control.bounds
        
    }
    
    @objc private func pan(recognizer: UIPanGestureRecognizer){
        let traslate = recognizer.location(in: control)
        let oldCenter = control.center
        
        control.center = CGPoint(x: control.center.x + traslate.x, y: control.center.y)
        recognizer.setTranslation(.zero, in: self)
        let offset: CGFloat = 10
        if control.center.x + control.bounds.width/2 >=
            self.bounds.width - offset ||
            control.center.x - control.bounds.width/2  <= offset{
            control.center = oldCenter
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: bounds.width/2, y: bounds.height/2))
//        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/2))
//        path.stroke()
    }
 
    

}
