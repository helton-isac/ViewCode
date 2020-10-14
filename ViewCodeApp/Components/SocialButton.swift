//
//  SocialButton.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

class SocialButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        setImage(image, for: .normal)
        imageView?.layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
