//
//  HoloView.swift
//  MVC
//
//  Created by 井民全 on 2021/8/19.
//

import UIKit

class HoloView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemPink
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(label)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with name: String){
        label.text = name
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(
            x: 10, y: 10, width: frame.size.width - 20, height: frame.size.width - 20
        )
    }
}
