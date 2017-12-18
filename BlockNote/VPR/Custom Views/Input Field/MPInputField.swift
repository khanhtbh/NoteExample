//
//  MPInputField.swift
//  MyPay
//
//  Created by Kei on 8/30/17.
//  Copyright © 2017 MySquar Payment Team. All rights reserved.
//

import UIKit

internal struct MPInputFieldColor {
    static let normalBorderColor = Utility.uiColorWith(0x000000, 0.15)
    static let focusBorderColor = Utility.uiColorWith(0x000000, 0.5)
    static let errorBorderColor = Utility.uiColorWith(0xFE3363, 1)
}

@objc protocol MPInputFieldDelegate: NSObjectProtocol {
    @objc optional func inputFieldDidBeginEditing(_ inputField: MPInputField)
    @objc optional func inputFieldEditing(_ inputField: MPInputField)
    @objc optional func inputFieldDidEndEditing(_ inputField: MPInputField)
}

enum MPInputFieldState {
    case normal
    case focused
    case error
}

@IBDesignable
class MPInputField: UIView, UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var contentView: UIView!
    @IBOutlet private weak var requireMark: UILabel!
    @IBOutlet private weak var inputField: UITextField!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var bottomBorder: UIView!
    @IBOutlet private weak var warningMark: UIImageView!
    
    private var _value: String?
    
    var validation: ((String) -> Bool)?
    
    var isInputValid: Bool {
        get {
            return validate()
        }
    }
    
    var state: MPInputFieldState = .normal {
        didSet {
            switch state {
            case .normal:
                bottomBorder.backgroundColor = MPInputFieldColor.normalBorderColor
                warningMark.isHidden = true
            case .focused:
                bottomBorder.backgroundColor = MPInputFieldColor.focusBorderColor
                warningMark.isHidden = true
            case .error:
                bottomBorder.backgroundColor = MPInputFieldColor.errorBorderColor
                warningMark.isHidden = false
            }
        }
    }
    
    #if TARGET_INTERFACE_BUILDER
    @IBOutlet open weak var delegate: AnyObject?
    #else
    open weak var delegate: MPInputFieldDelegate?
    #endif
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            inputField.keyboardType = keyboardType
        }
    }
    
    var textFieldInputView: UIView? {
        didSet {
            inputField.inputView = textFieldInputView
        }
    }
    
    var textFieldInputAccessory: UIView? {
        didSet {
            inputField.inputAccessoryView = textFieldInputAccessory
        }
    }
    
    @IBInspectable var validateWhenEndEditing: Bool = false
    
    @IBInspectable var isReadOnly: Bool = false {
        didSet {
            inputField.isUserInteractionEnabled = !isReadOnly
        }
    }
    
    @IBInspectable var isSecureField: Bool = false {
        didSet {
            inputField.isSecureTextEntry = isSecureField
        }
    }
    
    @IBInspectable var isRequiredField: Bool = false {
        didSet {
            requireMark.isHidden = !isRequiredField
        }
    }
    
    @IBInspectable override var tintColor: UIColor! {
        didSet {
            inputField.tintColor = tintColor
        }
    }

    
    @IBInspectable var caption: String? {
        didSet {
            captionLabel.text = caption
            inputField.placeholder = caption
        }
    }
    
    @IBInspectable var text: String? {
        set {
            _value = newValue
            inputField.text = _value
            captionLabel.isHidden = hideCaption || inputField.text?.count == 0
        }
        get {
            return _value
        }
        
    }
    
    @IBInspectable var hideCaption: Bool = false {
        didSet {
            captionLabel.isHidden = hideCaption || inputField.text?.count == 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupContentView()
        initView()
        setupNotification()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        initView()
        setupNotification()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupContentView()
        initView()
        setupNotification()
    }
    
    private func setupContentView() {
        contentView = UINib.init(nibName: "MPInputFieldView", bundle: Bundle.init(for: MPInputField.self)).instantiate(withOwner: self, options: nil)[0] as! UIView
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[contentView]-0-|", options: .alignAllTop, metrics: nil, views: ["contentView": contentView])
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentView]-0-|", options: .alignAllTop, metrics: nil, views: ["contentView": contentView])
        self.addConstraints(vConstraints)
        self.addConstraints(hConstraints)
        
        inputField.delegate = self
    }
    
    private func setupNotification() {
        inputField.addTarget(self, action: #selector(textChanged(_ :)), for: .editingChanged)
    }
    
    
    private func validate() -> Bool {
        var passed = true
        if isRequiredField && (_value?.count == 0 || _value == nil) {
            passed =  false
        }
        
        if let _validation = validation {
            passed = _validation(_value ?? "")
        }
        return passed
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupContentView()
        contentView.prepareForInterfaceBuilder()
        initView()
        
    }
    
    private func initView() {
        inputField.placeholder = caption
        inputField.text = _value
        inputField.isUserInteractionEnabled = !isReadOnly
        requireMark.isHidden = !isRequiredField
        captionLabel.text = caption
        captionLabel.isHidden = hideCaption || inputField.text?.count == 0
    }
    
    //MARK: - TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if state != .error { //If the input field state is error then we should not change this state until the value change
            state = .focused
        } else {
            //Send notification to display error message
        }
        delegate?.inputFieldDidBeginEditing?(self)
    }
    
    @objc private func textChanged(_ sender: Any) {
        _value = inputField.text
        captionLabel.isHidden = hideCaption || inputField.text?.count == 0
        if state == .error && isInputValid {
            state = .focused
        }
        delegate?.inputFieldEditing?(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomBorder.backgroundColor = MPInputFieldColor.normalBorderColor
        state = .normal
        if validateWhenEndEditing && !isInputValid {
            state = .error
        }
        
        delegate?.inputFieldDidEndEditing?(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    deinit {
        
    }
}
