//
//  LeftKeyboard.swift
//  Keyboard
//
//  Created by saix on 2018/4/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

/*
 page 0
 0: q w e r t
 1: a s d f g
 2: <shift> z x c v
 3: <123> <change> <setting> <space>
 
 page 1
 0: 1 2 3 4 5
 1: - / : ; (
 2: <#+=> <undo> . ,
 3: <ABC> <change> <setting> <space>
 
 page 2
 0: [ ] { } #
 1: _ \ | ~ <
 2: <123> <redo> . ,
 3: <ABC> <change> <setting> <space>
 
 */

func leftKeyboard() -> Keyboard {
    let leftKeyboard = Keyboard()
    
    // page 0
    // row 0
    for key in ["Q", "W", "E", "R", "T"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()
        leftKeyboard.add(key: keyModel, row: 0, page: 0)
    }
    // row 1
    for key in ["A", "S", "D", "F", "G"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()

        leftKeyboard.add(key: keyModel, row: 1, page: 0)
    }
    
    // row 2
    let shift = Key(.shift)
    leftKeyboard.add(key: shift, row: 2, page: 0)
    
    for key in ["Z", "X", "C", "V"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        keyModel.lowercaseKeyCap = key.lowercased()
        keyModel.lowercaseOutput = key.lowercased()

        leftKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    // row 3
    let keyModeChangeNumbers = Key(.modeChange)
    keyModeChangeNumbers.uppercaseKeyCap = "123"
    keyModeChangeNumbers.toMode = 1
    leftKeyboard.add(key: keyModeChangeNumbers, row: 3, page: 0)
    
    let keyboardChange = Key(.keyboardChange)
    leftKeyboard.add(key: keyboardChange, row: 3, page: 0)
    
    let settings = Key(.settings)
    leftKeyboard.add(key: settings, row: 3, page: 0)
    
    let space = Key(.space)
    space.uppercaseKeyCap = "space"
    space.uppercaseOutput = " "
    space.lowercaseOutput = " "
    leftKeyboard.add(key: space, row: 3, page: 0)
    
    
    // page 1
    // row 0
    for key in ["1", "2", "3", "4", "5"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 0, page: 1)
    }
    // row 1
    for key in ["-", "/", ":", ";", "("] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 1, page: 1)
    }
    // row 2
    let keyModeChangeSpecialCharacters = Key(.modeChange)
    keyModeChangeSpecialCharacters.uppercaseKeyCap = "#+="
    keyModeChangeSpecialCharacters.toMode = 2
    leftKeyboard.add(key: keyModeChangeSpecialCharacters, row: 2, page: 1)
    
    let undo = Key(.specialCharacter)
    undo.setLetter("undo")
    leftKeyboard.add(key: undo, row: 2, page: 1)
    
    for key in [".", ","] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 2, page: 1)
    }
    
    // row 3
    let keyModeChangeLetters = Key(.modeChange)
    keyModeChangeLetters.uppercaseKeyCap = "ABC"
    keyModeChangeLetters.toMode = 0
    leftKeyboard.add(key: keyModeChangeLetters, row: 3, page: 1)
    
    leftKeyboard.add(key: Key(keyboardChange), row: 3, page: 1)
    leftKeyboard.add(key: Key(settings), row: 3, page: 1)
    leftKeyboard.add(key: Key(space), row: 3, page: 1)
    

    // page 2
    // row 0
    for key in ["[", "]", "{", "}", "#"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 0, page: 2)
    }
    // row 1
    for key in ["_", "\\", "|", "~", "<"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 1, page: 2)
    }
    
    // row 2
    leftKeyboard.add(key: Key(keyModeChangeNumbers), row: 2, page: 2)
    for key in [".", ","] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        leftKeyboard.add(key: keyModel, row: 2, page: 2)
    }
    
    // row 3
    leftKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 2)
    leftKeyboard.add(key: Key(keyboardChange), row: 3, page: 2)
    leftKeyboard.add(key: Key(settings), row: 3, page: 2)
    leftKeyboard.add(key: Key(space), row: 3, page: 2)
    
    
    return leftKeyboard
}
