//
//  PressableMaterialButton.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/29.
//


import UIKit

class PressableMaterialButton: UIButton {
    
    private var shadowOffsetHeight: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        // ボタンの形を丸型に変更
        self.layer.cornerRadius = self.frame.height / 2
        // 影に色を指定してボタンに追加
        addShadow(with: .shadowColor)
    }
    
    private func addShadow(with color: UIColor) {
        // 影の大きさ
        self.layer.shadowOffset = CGSize(width: 0, height: shadowOffsetHeight)
        // 影の色
        self.layer.shadowColor = color.cgColor
        // 影のぼかし量
        self.layer.shadowRadius = 0
        // 影の不透明度
        self.layer.shadowOpacity = 1.0
    }
}

// MARK: - Touches methods
extension PressableMaterialButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pressedButtonAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        releasedButtonAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        releasedButtonAnimation()
    }
    
    private func pressedButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.transform = CGAffineTransform(translationX: 0, y: self.shadowOffsetHeight)
        }
        addShadowHeightAnimation(from: self.shadowOffsetHeight, to: 0, option: .easeIn)
    }
    
    private func releasedButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) {
            self.transform = CGAffineTransform.identity
        }
        addShadowHeightAnimation(from: 0, to: self.shadowOffsetHeight, option: .easeOut)
    }
    
    private func addShadowHeightAnimation(from fromValue: CGFloat, to toValue: CGFloat, option: CAMediaTimingFunctionName) {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.duration = 0.1
        animation.fromValue = CGSize(width: 0, height: fromValue)
        animation.toValue = CGSize(width: 0, height: toValue)
        animation.timingFunction = CAMediaTimingFunction(name: option)
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}
