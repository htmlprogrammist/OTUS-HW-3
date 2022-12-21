//
//  CustomActivityIndicator.swift
//  Task-22
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import UIKit

final class CustomActivityIndicator: UIView {
    
    // MARK: - Public Properties
    
    /// Duration of the ring's fill animation. Default is `3.0`.
    public var duration: TimeInterval = 3
    
    /// Sets the line width for activity indicator.
    public var lineWidth: CGFloat = 8
    
    /// Color of the activity indicator.
    public var color: UIColor = .systemGray3
    
    /// Timing function of the ring's fill animation. Default is `.easeOut`.
    public var timingFunction: CAMediaTimingFunction = .init(name: CAMediaTimingFunctionName.easeOut)
    
    // MARK: - Private Properties
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let circleLayer = CAShapeLayer()
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = nil
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineCap = .round
        return circleLayer
    }()
    
    private lazy var loopingAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = Double.pi * 2
        animation.duration = duration
        animation.repeatCount = .infinity
        return animation
    }()
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.addSublayer(indicatorLayer)
        addAnimation()
    }
    
    // MARK: - Private Methods
    
    private func addAnimation() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        indicatorLayer.position = center
        let bezierPath = UIBezierPath(arcCenter: .zero, radius: bounds.width / 2 - lineWidth / 2, startAngle: -Double.pi / 2, endAngle: 1.5 * Double.pi, clockwise: true)
        indicatorLayer.path = bezierPath.cgPath
        
        let strokeStartAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        let strokeEndAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        let animations = [strokeStartAnimation, strokeEndAnimation]
        
        animations.forEach {
            $0.fromValue = 0
            $0.toValue = 1.0
        }
        strokeStartAnimation.beginTime = 0.5
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.animations = animations
        strokeAnimationGroup.timingFunction = timingFunction
        strokeAnimationGroup.duration = duration
        strokeAnimationGroup.repeatCount = .infinity
        
        indicatorLayer.add(strokeAnimationGroup, forKey: "strokeAnimationGroup")
        indicatorLayer.add(loopingAnimation, forKey: "rotationAnimation")
    }
}
