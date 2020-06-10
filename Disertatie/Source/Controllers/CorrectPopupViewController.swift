//
//  CorrectViewController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

protocol CorrectPopupDelegate: class {
    func didEditMessage(at indexPath: IndexPath, _ correctedText: String)
}

class CorrectPopupViewController: BaseController {
    private var popupView: UIView!
    private var originalMessageLabel: UILabel!
    private var correctTextView: UITextView!
    private var saveButton: RoundedButton!
    
    var textToCorrect: String?
    var indexPath: IndexPath?
    
    weak var delegate: CorrectPopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
        
        // TODO: Tap on popupView dismisses the entire Popup
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // view.addBlur(style: .extraLight)
    }
}

extension CorrectPopupViewController: Base {
    func initializeUI() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        popupView = UIView()
        popupView.backgroundColor = .primary
        popupView.isUserInteractionEnabled = true
        popupView.roundCorners(value: 16)
        
        let originalLabel = UILabel(text: Translations.original.uppercased())
        originalLabel.setStyle(font: .primary(ofSize: .small2, weight: .bold),
                               color: .white)
    
        originalMessageLabel = UILabel.centered(withText: textToCorrect ?? "",
                                                multiline: true)
        originalMessageLabel.setStyle(font: .primary(ofSize: .medium1),
                                      color: .white)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .white
        
        let correctedLabel = UILabel(text: Translations.corrected.uppercased())
        correctedLabel.setStyle(font: UIFont.primary(ofSize: .small2, weight: .bold),
                                color: .white)
        
        correctTextView = UITextView()
        correctTextView.backgroundColor = .primary
        correctTextView.isScrollEnabled = false
        correctTextView.font = UIFont.primary(ofSize: .medium1)
        correctTextView.textColor = .white
        correctTextView.textAlignment = .center
        correctTextView.tintColor = .white
        correctTextView.becomeFirstResponder()
        // correctTextView.delegate = self
        
        saveButton = RoundedButton(title: "Save",
                                   titleColor: .primary,
                                   font: .primary(ofSize: .small2, weight: .bold),
                                   backgroundColor: .white)
        
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        // Setup constraints
        
        view.add(popupView, then: {
            $0.pin(.middle, to: view, offsetBy: .init(horizontal: 22))
            $0.setBounds(.vertically, to: view, offsetBy: .init(vertical: 40))
            $0.layout { $0.centerY == view.centerYAnchor }
        })
        
        popupView.add(originalLabel, then: {
            $0.layout {
                $0.top == popupView.topAnchor + 15
                $0.centerX == popupView.centerXAnchor
            }
        })
        
        popupView.add(originalMessageLabel, then: {
            $0.pin(.middle, to: popupView, offsetBy: .init(horizontal: 40))
            $0.layout {
                $0.top == originalLabel.bottomAnchor + 10
            }
        })
        
        popupView.add(separatorView, then: {
            $0.pin(.middle, to: popupView, offsetBy: .all(50))
            $0.layout { $0.top == originalMessageLabel.bottomAnchor + 20 }
            
            $0.layoutDimensions { $0.height == 1 }
        })
        
        popupView.add(correctedLabel, then: {
            $0.layout {
                $0.top == separatorView.bottomAnchor + 15
                $0.centerX == popupView.centerXAnchor
            }
        })
        
        popupView.add(correctTextView, then: {
            $0.pin(.middle, to: popupView, offsetBy: .init(horizontal: 40))
            $0.layout {
                $0.top == correctedLabel.bottomAnchor + 10
                // $0.bottom == popupView.bottomAnchor - 20
            }
        })
        
        popupView.add(saveButton, then: {
            $0.layout {
                $0.top == correctTextView.bottomAnchor + 20
                $0.bottom == popupView.bottomAnchor - 15
                $0.trailing == popupView.trailingAnchor - 15
            }
            $0.constraint(width: 85, height: 36)
        })
    }
    
    func updateTexts() {}
    
    @objc
    func saveAction() {
        guard
            let indexPath = self.indexPath,
            !correctTextView.text.isEmpty else {
            return
        }
        
        delegate?.didEditMessage(at: indexPath, correctTextView.text)
    }
    
    @objc
    func close() {
        dismiss(animated: true, completion: nil)
    }
}
