//
//  AdvancedTextFieldDelegate.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/09/23.
//

import Foundation

protocol AdvancedTextFieldDelegate: AnyObject {
    func editingChanged(_ sender: AdvancedTextfieldUIView)
    func editingDidEnd(_ sender: AdvancedTextfieldUIView)
}
