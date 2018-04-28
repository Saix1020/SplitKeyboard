//
//  SplitKeyboardLayout.swift
//  Keyboard
//
//  Created by saix on 2018/4/28.
//  Copyright © 2018年 Apple. All rights reserved.
//
import UIKit

extension KeyboardLayout {
    static let placehoderSpace = CGFloat(220)
    static let gapSpace = CGFloat(16)
    static let shiftSpaceDelta = CGFloat(12)
    
    func layoutKeysRow(pageNum: Int,
                       rowNum: Int,
                       row: [Key],
                       keyWidth: CGFloat,
                       sideSpace: Int,
                       keyGap: CGFloat,
                       frame: CGRect) -> [CGRect]
    {
        var frames = [CGRect]()
        switch pageNum {
        case 0:
                return layoutKeysRowForPage0(rowNum: rowNum, row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
        case 1:
            return layoutKeysRowForPage1(rowNum: rowNum, row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
            break
        case 2:
            return layoutKeysRowForPage2(rowNum: rowNum, row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
            break
        default:
            break
        }
        
        
        return frames
        
    }
    
    func layoutKeysRowForPage0(rowNum: Int, row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        switch rowNum {
        case 0:
            return layoutKeysRowForPage0Row0(row: row,
                                              keyWidth: keyWidth,
                                              sideSpace: sideSpace,
                                              keyGap: keyGap,
                                              frame: frame)
        case 1:
            return layoutKeysRowForPage0Row1(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        case 2:
            return layoutKeysRowForPage0Row2(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        case 3:
            return layoutKeysRowForPage0Row3(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        default:
            break
        }
        return frames

    }
    
    func layoutKeysRowForPage0Row0(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        
        //0: q w e r t <gap> <placehoder> y u i o p <backspace>
        var currentOrigin = frame.origin.x + CGFloat(sideSpace)
        for (index, key) in row.enumerated(){
            var rect = CGRect()
            rect.origin.x = currentOrigin
            rect.origin.y = frame.origin.y
            rect.size.width = keyWidth
            rect.size.height = frame.size.height
            
            if(index == row.count-1){
                if(rect.maxX < frame.size.width - CGFloat(sideSpace)) {
                    rect.size.width = frame.size.width - CGFloat(sideSpace) - rect.origin.x
                }
            }
            
            frames.append(rect)
            
            currentOrigin += (rect.size.width + keyGap)
            if(index == 4) {
                currentOrigin += KeyboardLayout.gapSpace + CGFloat(sideSpace) + KeyboardLayout.placehoderSpace + keyGap
            }
            
        }
        
        
        return frames;
    }
    
    func layoutKeysRowForPage0Row1(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        
        //<gap> a s d f g <placehoder> <gap> h j k l <return>
        var currentOrigin = frame.origin.x + CGFloat(sideSpace) + KeyboardLayout.gapSpace + CGFloat(sideSpace)
        for (index, key) in row.enumerated(){
            var rect = CGRect()
            rect.origin.x = currentOrigin
            rect.origin.y = frame.origin.y
            rect.size.width = keyWidth
            rect.size.height = frame.size.height
            
            if(index == row.count-1){
                if(rect.maxX < frame.size.width - CGFloat(sideSpace)) {
                    rect.size.width = frame.size.width - CGFloat(sideSpace) - rect.origin.x
                }
            }
            
            frames.append(rect)
            
            currentOrigin += (rect.size.width + keyGap)
            if(index == 4) {
                // <placehoder> <gap>
                currentOrigin += KeyboardLayout.placehoderSpace + keyGap + KeyboardLayout.gapSpace + keyGap
            }
            
        }
        
        
        return frames;
    }
    
    func layoutKeysRowForPage0Row2(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        
        //<shift> z x c v <gap> <placehoder> b n m !/, ?/. <shift>
        var currentOrigin = frame.origin.x + CGFloat(sideSpace)
        for (index, key) in row.enumerated(){
            var rect = CGRect()
            rect.origin.x = currentOrigin
            rect.origin.y = frame.origin.y
            rect.size.width = keyWidth
            rect.size.height = frame.size.height
            
            if(index == row.count-1){
                if(rect.maxX < frame.size.width - CGFloat(sideSpace)) {
                    rect.size.width = frame.size.width - CGFloat(sideSpace) - rect.origin.x
                }
            }
            else if(index == 0) { // shift
                rect.size.width = rect.size.width + KeyboardLayout.shiftSpaceDelta
            }
            
            
            frames.append(rect)
            
            currentOrigin += (rect.size.width + keyGap)
            if(index == 4) {
                // <gap> <placehoder>
                currentOrigin += KeyboardLayout.gapSpace + CGFloat(sideSpace) + KeyboardLayout.placehoderSpace + keyGap - KeyboardLayout.shiftSpaceDelta
            }
            
        }
        
        
        return frames;
    }
    
    func layoutKeysRowForPage0Row3(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        
        //<123> <change> <setting> <space> <placehoder> <space> <123> <setting/dismiss>
        var currentOrigin = frame.origin.x + CGFloat(sideSpace)
        for (index, key) in row.enumerated(){
            var rect = CGRect()
            rect.origin.x = currentOrigin
            rect.origin.y = frame.origin.y
            rect.size.width = keyWidth
            rect.size.height = frame.size.height
            
            if(index == row.count-1){
                if(rect.maxX < frame.size.width - CGFloat(sideSpace)) {
                    rect.size.width = frame.size.width - CGFloat(sideSpace) - rect.origin.x
                }
            }
            else if(index == 0) { // key "123"
                rect.size.width = rect.size.width + KeyboardLayout.gapSpace + CGFloat(sideSpace)
            }
            else if (index == 3) { // first space
                rect.size.width = keyWidth*2 + keyGap
            }
            else  if(index == 4) {
                rect.size.width = keyWidth * 3 + 2 * keyGap
            }
            else if(index == 5) {
                rect.size.width = keyWidth * 2 + keyGap
            }
            
            
            frames.append(rect)
            
            currentOrigin += (rect.size.width + keyGap)
            if(index == 3) {
                currentOrigin += KeyboardLayout.placehoderSpace + keyGap
            }
            
        }
        return frames;
    }
    
    // page 1
    func layoutKeysRowForPage1(rowNum: Int, row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        switch rowNum {
        case 0:
            return layoutKeysRowForPage1Row0(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        case 1:
            return layoutKeysRowForPage1Row1(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        case 2:
            return layoutKeysRowForPage1Row2(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        case 3:
            return layoutKeysRowForPage1Row3(row: row,
                                             keyWidth: keyWidth,
                                             sideSpace: sideSpace,
                                             keyGap: keyGap,
                                             frame: frame)
        default:
            break
        }
        return frames
        
    }
    
    func layoutKeysRowForPage1Row0(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        //1 2 3 4 5 <placehoder> 6 7 8 9 0 <backspace>
        return layoutKeysRowForPage0Row0(row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
    }
    
    func layoutKeysRowForPage1Row1(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        //- / : ; ( <placehoder> ) $ & @ <return>
        return layoutKeysRowForPage0Row1(row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
    }
    
    func layoutKeysRowForPage1Row2(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        var frames = [CGRect]()
        
        //<#+=> <undo> . , <placehoder> ? ! ' " <123>
        var currentOrigin = frame.origin.x + CGFloat(sideSpace)
        for (index, key) in row.enumerated(){
            var rect = CGRect()
            rect.origin.x = currentOrigin
            rect.origin.y = frame.origin.y
            rect.size.width = keyWidth
            rect.size.height = frame.size.height
            
            if(index == row.count-1){
                if(rect.maxX < frame.size.width - CGFloat(sideSpace)) {
                    rect.size.width = frame.size.width - CGFloat(sideSpace) - rect.origin.x
                }
            }
            else if(index == 0) { // shift
                rect.size.width = keyWidth + KeyboardLayout.gapSpace + keyGap - 4
            }
            else if(index == 1) {
                rect.size.width = keyWidth*2 + keyGap
            }
            
            
            frames.append(rect)
            
            currentOrigin += (rect.size.width + keyGap)
            if(index == 3) {
                // <placehoder> <gap>
                currentOrigin += KeyboardLayout.placehoderSpace + keyGap + KeyboardLayout.gapSpace + CGFloat(sideSpace) + 4
            }
            
        }
        
        
        return frames;
    }
    
    func layoutKeysRowForPage1Row3(row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        return layoutKeysRowForPage0Row3(row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame)
    }
    

    // page 1
    func layoutKeysRowForPage2(rowNum: Int, row: [Key], keyWidth: CGFloat, sideSpace: Int, keyGap: CGFloat, frame: CGRect) -> [CGRect] {
        return layoutKeysRowForPage1(rowNum: rowNum, row: row, keyWidth: keyWidth, sideSpace: sideSpace, keyGap: keyGap, frame: frame);
    }
    
    
}
