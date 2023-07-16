//
//  VerticalScrollView.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/17.
//

import UIKit

class VerticalScrollView: UIScrollView {
    override var contentOffset: CGPoint {
        get {
            return super.contentOffset
        }
        set {
            // 水平方向のスクロールを無効にし、x座標を常に0に固定
            super.contentOffset = CGPoint(x: 0, y: newValue.y)
        }
    }
}

