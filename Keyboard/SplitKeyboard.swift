//
//  SplitKeyboard.swift
//  Keyboard
//
//  Created by saix on 2018/4/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

//
//  splitKeyboard.swift
//  TransliteratingKeyboard
//
//  Created by Alexei Baboulevitch on 7/10/14.
//  Copyright (c) 2014 Alexei Baboulevitch ("Archagon"). All rights reserved.
//

/*
 page 0
 0: q w e r t <placehoder> y u i o p <backspace>
 1: a s d f g <placehoder> h j k l <return>
 2: <shift> z x c v <placehoder> b n m !/, ?/. <shift>
 3: <123> <change> <setting> <space> <placehoder> <space> <123> <setting/dismiss>
 
 page 1
 0: 1 2 3 4 5 <placehoder> 6 7 8 9 0 <backspace>
 1: - / : ; ( <placehoder> ) $ & @ <return>
 2: <#+=> <undo> . , <placehoder> ? ! ' " <123>
 3: <ABC> <change> <setting> <space> <placehoder> <space> <123> <setting/dismiss>
 
 page 2
 0: [ ] { } # <placehoder> % ^ * + = <backspace>
 1: _ \ | ~ < <placehoder> > € £ ¥ <return>
 2: <123> <redo> . , <placehoder> ? ! ' " <123>
 3: <ABC> <change> <setting> <space> <placehoder> <space> <123> <setting/dismiss>
 
 */



func splitKeyboard() -> Keyboard {
    let splitKeyboard = Keyboard()
    
//    let placehoderKey = Key(.placeholder)
    
    let backspaceKey = Key(.backspace)
    
    let shiftKey = Key(.shift)
    
    let keyModeChangeNumbers = Key(.modeChange)
    keyModeChangeNumbers.uppercaseKeyCap = "123"
    keyModeChangeNumbers.toMode = 1
    
    let keyboardChange = Key(.keyboardChange)
    
    let settings = Key(.settings)
    
    let space = Key(.space)
    space.uppercaseKeyCap = ""
    space.uppercaseOutput = " "
    space.lowercaseOutput = " "
    
    let returnKey = Key(.return)
    returnKey.uppercaseKeyCap = "return"
    returnKey.uppercaseOutput = "\n"
    returnKey.lowercaseOutput = "\n"
    
    let keyModeChangeSpecialCharacters = Key(.modeChange)
    keyModeChangeSpecialCharacters.uppercaseKeyCap = "#+="
    keyModeChangeSpecialCharacters.toMode = 2

    let keyModeChangeLetters = Key(.modeChange)
    keyModeChangeLetters.uppercaseKeyCap = "ABC"
    keyModeChangeLetters.toMode = 0
    
//    let gapKey = Key(.gap)

    // page 0
    // row 0
    for key in ["Q", "W", "E", "R", "T"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 0)
    }
//    splitKeyboard.add(key: Key(gapKey), row: 0, page: 0)
//    splitKeyboard.add(key: Key(placehoderKey), row: 0, page: 0)
    
    for key in ["Y", "U", "I", "O", "P"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 0)
    }
    splitKeyboard.add(key: Key(backspaceKey), row: 0, page: 0)

    
    // row 1
//    splitKeyboard.add(key: Key(gapKey), row: 1, page: 0)
    for key in ["A", "S", "D", "F", "G"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 0)
    }
//    splitKeyboard.add(key: Key(placehoderKey), row: 1, page: 0)
//    splitKeyboard.add(key: Key(gapKey), row: 1, page: 0)
    for key in ["H", "J", "K", "L"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 0)
    }
    splitKeyboard.add(key: Key(returnKey), row: 1, page: 0)

    // row 2
    splitKeyboard.add(key: Key(shiftKey), row: 2, page: 0)
    
    for key in ["Z", "X", "C", "V"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 0)
    }
//    splitKeyboard.add(key: Key(gapKey), row: 2, page: 0)
//
//    splitKeyboard.add(key: Key(placehoderKey), row: 2, page: 0)

    for key in ["B", "N", "M"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    if true {
        let keyModel = Key(.character)
        keyModel.setLetter(",")
        keyModel.uppercaseKeyCap = "!"
        keyModel.uppercaseOutput = "!"
        splitKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    
    if true {
        let keyModel = Key(.character)
        keyModel.setLetter(".")
        keyModel.uppercaseKeyCap = "?"
        keyModel.uppercaseOutput = "?"
        splitKeyboard.add(key: keyModel, row: 2, page: 0)
    }
    
    splitKeyboard.add(key: Key(shiftKey), row: 2, page: 0)
    
    
    // row 3
    splitKeyboard.add(key: Key(keyModeChangeNumbers), row: 3, page: 0)
    splitKeyboard.add(key: Key(keyboardChange), row: 3, page: 0)
    splitKeyboard.add(key: Key(settings), row: 3, page: 0)
    splitKeyboard.add(key: Key(space), row: 3, page: 0)
//    splitKeyboard.add(key: Key(placehoderKey), row: 3, page: 0)
    splitKeyboard.add(key: Key(space), row: 3, page: 0)
    splitKeyboard.add(key: Key(keyModeChangeNumbers), row: 3, page: 0)
    // TODO
    // dismiss key
    splitKeyboard.add(key: Key(settings), row: 3, page: 0)

    
    
    // page 1
    // row 0
    for key in ["1", "2", "3", "4", "5"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 1)
    }
//    splitKeyboard.add(key: Key(gapKey), row: 0, page: 1)
//    splitKeyboard.add(key: Key(placehoderKey), row: 0, page: 1)
    for key in ["6", "7", "8", "9", "0"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 1)
    }
    splitKeyboard.add(key: Key(backspaceKey), row: 0, page: 1)
    
    // row 1
//    splitKeyboard.add(key: Key(gapKey), row: 1, page: 1)
    for key in ["-", "/", ":", ";", "("] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 1)
    }

//    splitKeyboard.add(key: Key(placehoderKey), row: 1, page: 1)
//    splitKeyboard.add(key: Key(gapKey), row: 1, page: 1)

    for key in [")", "$", "&", "@"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 1)
    }
    splitKeyboard.add(key: Key(returnKey), row: 1, page: 1)
    
    // row 2
    splitKeyboard.add(key: Key(keyModeChangeSpecialCharacters), row: 2, page: 1)
    let undoKey = Key(.modeChange)
    undoKey.setLetter("undo")
    splitKeyboard.add(key: undoKey, row: 2, page: 1)
    for key in [".", ","] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 1)
    }
//    splitKeyboard.add(key: Key(placehoderKey), row: 2, page: 1)
    for key in ["?", "!", "'", "\""] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 1)
    }
    splitKeyboard.add(key: Key(keyModeChangeSpecialCharacters), row: 2, page: 1)
    
    // row 3
    splitKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 1)
    splitKeyboard.add(key: Key(keyboardChange), row: 3, page: 1)
    splitKeyboard.add(key: Key(settings), row: 3, page: 1)
    splitKeyboard.add(key: Key(space), row: 3, page: 1)
//    splitKeyboard.add(key: Key(placehoderKey), row: 3, page: 1)
    splitKeyboard.add(key: Key(space), row: 3, page: 1)
    splitKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 1)
    splitKeyboard.add(key: Key(settings), row: 3, page: 1)


    // page 2
    // row 0
    for key in ["[", "]", "{", "}", "#"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 2)
    }
//    splitKeyboard.add(key: Key(placehoderKey), row: 0, page: 2)
    for key in ["%", "^", "*", "+", "="] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 0, page: 2)
    }
    splitKeyboard.add(key: backspaceKey, row: 0, page: 2)

    // row 1
    for key in ["_", "\\", "|", "~", "<"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 2)
    }
//    splitKeyboard.add(key: Key(placehoderKey), row: 1, page: 2)
    for key in [">", "€", "£", "¥"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 1, page: 2)
    }
    splitKeyboard.add(key: returnKey, row: 1, page: 2)

    // row 2
    splitKeyboard.add(key: Key(keyModeChangeNumbers), row: 2, page: 2)
    let redoKey = Key(.modeChange)
    redoKey.setLetter("redo")
    splitKeyboard.add(key: redoKey, row: 2, page: 2)

    for key in [".", ","] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 2)
    }
//    splitKeyboard.add(key: Key(placehoderKey), row: 2, page: 2)
    for key in ["?", "!", "'", "\""] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        splitKeyboard.add(key: keyModel, row: 2, page: 2)
    }
    splitKeyboard.add(key: keyModeChangeNumbers, row: 2, page: 2)
    
    // row3
    splitKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 2)
    splitKeyboard.add(key: Key(keyboardChange), row: 3, page: 2)
    splitKeyboard.add(key: Key(settings), row: 3, page: 2)
    splitKeyboard.add(key: Key(space), row: 3, page: 2)
//    splitKeyboard.add(key: Key(placehoderKey), row: 3, page: 2)
    splitKeyboard.add(key: Key(space), row: 3, page: 2)
    splitKeyboard.add(key: Key(keyModeChangeLetters), row: 3, page: 2)
    splitKeyboard.add(key: Key(settings), row: 3, page: 2)
    
    return splitKeyboard
}

