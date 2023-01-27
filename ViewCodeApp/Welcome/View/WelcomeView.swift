//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped(with phone:String)
    func signUpButtonTapped()
    func facebookButtonTapped()
    func googleButtonTapped()
}

class WelcomeView: UIView, CodeView {
    
    //MARK: - Properties
    weak var delegate: WelcomeViewDelegate?
    
    //MARK: - Components
    private lazy var  mainImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "home"))
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = .welcome
        label.textAlignment = .center
        label.font = .title
        label.textColor = .title
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = .main
        label.textAlignment = .center
        label.font = .body
        label.textColor = .body
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = .phone
        textField.textAlignment = .center
        textField.keyboardType = .phonePad
        textField.borderStyle = .roundedRect
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginButton = AppButton(style: .primary, title: .login)
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(.signUp, for: .normal)
        button.titleLabel?.font = .button
        button.backgroundColor = .secondaryButton
        button.setTitleColor(.secondayButtonText, for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.secondaryButtonBorder.cgColor

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initializer
    init(delegate: WelcomeViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    //MARK: - Super Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setupComponents() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(phoneTextField)
        addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(signUpButton)

    }
    
    func setupConstraints() {
        //LayoutAnchors
        
        NSLayoutConstraint.activate([
            //Image
            mainImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Margin.verticalLarge),
            mainImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Margin.horizontal),
            mainImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Margin.horizontal),
            mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //Title
            titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: Margin.verticalVeryLarge),
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor),
            
            //Body
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Margin.verticalSmall),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            //TextField
            phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: Margin.verticalLarge),
            phoneTextField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
            
            //ButtonStackView
            buttonsStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: Margin.verticalLarge),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //Buttons
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            
            signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            
        ])
        

    }
    
    func setupExtraConfiguration() {
        backgroundColor = .view
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    @objc private func buttonTapped(sender: UIButton){
        switch sender{
        case loginButton:
            delegate?.loginButtonTapped(with: phoneTextField.text ?? "")
        case signUpButton:
            delegate?.signUpButtonTapped()
        default:
            break
        }
    }

   

}
