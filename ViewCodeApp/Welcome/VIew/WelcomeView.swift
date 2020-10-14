//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped(withPhone: String)
    func signUpButtonTapped()
    func facebookButtonTapped()
    func googleButtonTapped()
    
}

class WelcomeView: UIView, CodeView {
    
    // MARK: - Properties
    weak var delegate: WelcomeViewDelegate?
    
    @ViewCodeComponent
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    @ViewCodeComponent
    var contentView: UIView = {
        let contentView = UIView(frame: .zero)
        return contentView
    }()
    
    @ViewCodeComponent
    var mainImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image =  #imageLiteral(resourceName: "home")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    @ViewCodeComponent
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.welcome
        label.textAlignment = .center
        label.font = .title
        label.textColor = .title
        label.accessibilityIdentifier = "welcome-title-label"
        return label
    }()
    
    @ViewCodeComponent
    var bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.main
        label.textAlignment = .center
        label.font = .body
        label.textColor = .body
        label.numberOfLines = 0
        return label
    }()
    
    @ViewCodeComponent
    var phoneTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = Localization.phone
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        return textField
    }()
    
    @ViewCodeComponent
    var buttonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        return stackView
    }()
    @ViewCodeComponent
    var loginButton = WelcomeButton(style: .main, title: Localization.loginButton)
    @ViewCodeComponent
    var signUpButton = WelcomeButton(style: .secondary, title: Localization.signupSignupButtom)
    
    
    @ViewCodeComponent
    var socialButtonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        return stackView
    }()
    @ViewCodeComponent
    var facebookButton = SocialButton(image: #imageLiteral(resourceName: "facebook"))
    @ViewCodeComponent
    var googleButton = SocialButton(image: #imageLiteral(resourceName: "google"))
    
    @ViewCodeComponent
    var bottomLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.social
        label.textAlignment = .center
        label.font = .body
        label.textColor = .body
        label.numberOfLines = 0
        return label
    }()
    

    
    // MARK: - Super Methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    init(delegate: WelcomeViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    func setupComponents() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(signUpButton)
        
        contentView.addSubview(socialButtonsStackView)
        socialButtonsStackView.addArrangedSubview(facebookButton)
        socialButtonsStackView.addArrangedSubview(googleButton)
        
        contentView.addSubview(bottomLabel)
    }
    
    func setupConstraints() {
        
        //NSLayoutContraints
        
        //VFL (Visual Format Language)
        
        //Layout Anchors
        
        //ScrollView
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //ContentView
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
        
        //MainImage
        mainImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Margin.verticalVeryLarge).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Margin.horizontal).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Margin.horizontal).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        //TitleLabel
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor,constant: Margin.verticalVeryLarge).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        //BodyLabel
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: Margin.verticalSmall).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        //PhoneTextField
        phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: Margin.verticalLarge).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor).isActive  = true
        
        //ButtonsStackView
        buttonsStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: Margin.verticalNormal).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        //Login/SignUp Buttons
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
        
        //SocialButtonsStackView
        socialButtonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Margin.verticalLarge).isActive = true
        socialButtonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        //FaceBook/Google Buttons
        facebookButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        googleButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        
        bottomLabel.bottomAnchor.constraint(equalTo: socialButtonsStackView.topAnchor, constant: -Margin.verticalLarge).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .view
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        switch sender {
        case loginButton:
            delegate?.loginButtonTapped(withPhone: phoneTextField.text!)
        case signUpButton:
            delegate?.signUpButtonTapped()
        default:
            break;
        }
    }
}
