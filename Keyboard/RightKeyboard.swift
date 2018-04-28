//
//  RightKeyboard.swift
//  Keyboard
//
//  Created by saix on 2018/4/27.
//  Copyright © 2018年 Apple. All rights reserved.
//
/*
 page 0
 0: y u i o p <backspace>
 1: h j k l <return>
 2: b n m !/, ?/. <shift>
 3: <space> <123> <setting/dismiss>
 
 page 1
 0: 6 7 8 9 0 <backspace>
 1: ) $ & @ <return>
 2: ? ! ' " <#+=>
 3: <space> <123> <setting/dismiss>
 
 page 2
 0: % ^ * + = <backspace>
 1: > € £ ¥ <return>
 2: ? ! ' " <123>
 3: <space> <123> <setting/dismiss>

 */

func rightKeyboard() -> Keyboard {
    let rightKeyboard = Keyboard()
    let backspace = Key(.backspace)
    let shift = Key(.shift)
    let returnKey = Key(.return)
    returnKey.uppercaseKeyCap = "return"
    returnKey.uppercaseOutput = "\n"
    returnKey.lowercaseOutput = "\n"

    // page 0
    // row 0
    for key in [ "Y", "U", "I", "O", "P"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()
        rightKeyboard.add(key: keyModel, row: 0, page: 0)
    }
    rightKeyboard.add(key: backspace, row: 0, page: 0)
    
    // row 1
    for key in ["H", "J", "K", "L"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()
        rightKeyboard.add(key: keyModel, row: 1, page: 0)
    }
    rightKeyboard.add(key: returnKey, row: 1, page: 0)
    
    
    
    // row 2
    for key in ["B", "N", "M", ".", ","] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()
        rightKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    rightKeyboard.add(key: shift, row: 2, page: 0)

    // row 3
    let space = Key(.space)
    space.uppercaseKeyCap = "space"
    space.uppercaseOutput = " "
    space.lowercaseOutput = " "
    rightKeyboard.add(key: space, row: 3, page: 0)

    let keyModeChangeNumbers = Key(.modeChange)
    keyModeChangeNumbers.uppercaseKeyCap = "123"
    keyModeChangeNumbers.toMode = 1
    rightKeyboard.add(key: keyModeChangeNumbers, row: 3, page: 0)
    
    let settings = Key(.settings)
    rightKeyboard.add(key: settings, row: 3, page: 0)
    
    
    // page 1
    // row 0
    for key in ["6", "7", "8", "9", "0"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 0, page: 1)
    }
    rightKeyboard.add(key: backspace, row: 0, page: 1)
    
    // row 1
    for key in [")", "$", "&", "@"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 1, page: 1)
    }
    rightKeyboard.add(key: returnKey, row: 1, page: 1)
    
    
    // row 2
    for key in [ "?", "!", "'", "\""] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 2, page: 1)
    }
    let keyModeChangeSpecialCharacters = Key(.modeChange)
    keyModeChangeSpecialCharacters.uppercaseKeyCap = "#+="
    keyModeChangeSpecialCharacters.toMode = 2
    rightKeyboard.add(key: keyModeChangeSpecialCharacters, row: 2, page: 1)
    
    // row 3
    rightKeyboard.add(key: Key(space), row: 3, page: 1)
    let keyModeChangeLetters = Key(.modeChange)
    keyModeChangeLetters.uppercaseKeyCap = "ABC"
    keyModeChangeLetters.toMode = 0
    rightKeyboard.add(key: keyModeChangeLetters, row: 3, page: 1)
    rightKeyboard.add(key: Key(settings), row: 3, page: 2)

//    let dissmiss = Key(.specialCharacter)
//    dissmiss.setLetter("Dismiss")
//    rightKeyboard.add(key: dissmiss, row: 3, page: 1)
    
    // page 2
    // row 0
    for key in ["%", "^", "*", "+", "="] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 0, page: 2)
    }
    rightKeyboard.add(key: backspace, row: 1, page: 1)

    // row 1
    for key in [">", "€", "£", "¥"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 1, page: 2)
    }
    rightKeyboard.add(key: returnKey, row: 1, page: 1)

    
    // row 2
    for key in ["?", "!", "'"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        rightKeyboard.add(key: keyModel, row: 2, page: 2)
    }
    rightKeyboard.add(key: Key(keyModeChangeNumbers), row: 2, page: 2)

    // row 3
    rightKeyboard.add(key: Key(space), row: 3, page: 2)
    rightKeyboard.add(key: Key(keyModeChangeLetters), row:3, page:2)
    rightKeyboard.add(key: Key(settings), row: 3, page: 2)
    
    return rightKeyboard
}

