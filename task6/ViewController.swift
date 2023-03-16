//
//  ViewController.swift
//  task6
//
//  Created by Gleb Tregubov on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var rectView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        rectView = UIView(frame: .init(origin: .zero, size: CGSize(width: 100, height: 100)))
        rectView.center = view.convert(view.center, from: view.window)
        rectView.backgroundColor = .systemBlue
        rectView.layer.cornerRadius = 10

        rectView.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
        view.addSubview(rectView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: view)
            let angle = location.x > self.rectView.center.x ? 23 : -23
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5) {
                self.rectView.center = location
            }
            UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                    self.rectView.transform = CGAffineTransform(rotationAngle: CGFloat(angle) * .pi / 180)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                    self.rectView.transform = .identity
                }
            }
        }
    }

}

