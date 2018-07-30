//
//  VerticalLabel.swift
//  TTB
//
//  Created by S-Shimotori on 2018/07/22.
//  Copyright © 2018 Shigure Shimotori. All rights reserved.
//

import UIKit

class VerticalLabel: UIView {
    var text = "フォントと組版の３０分入門"

    convenience init(text: String) {
        self.init()
        self.text = text
    }

    override func draw(_ rect: CGRect) {
        let attrStr = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: text.count)
        attrStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 28), range: range)
        attrStr.addAttribute(.kern, value: 3.8, range: range)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = -5
        attrStr.addAttribute(.paragraphStyle, value: style, range: range)

        /**
         * `static let verticalGlyphForm: NSAttributedString.Key`
         *
         * > The value 0 indicates horizontal text.
         * > The value 1 indicates vertical text.
         * > In iOS, horizontal text is always used and specifying a different value is undefined.
         *
         * If the value is 1, attributed text use vertical glyph.
         */
        attrStr.addAttribute(.verticalGlyphForm, value: 1, range: range)

        /**
         * `CTFramesetter`
         *
         * > CTFramesetter is an object factory for CTFrame objects.
         */
        let framesetter = CTFramesetterCreateWithAttributedString(attrStr as CFMutableAttributedString)
        let layoutAttrDict = [:]/*[CTFrameProgression.topToBottom: 1]*/ as CFDictionary

        let framePath = UIBezierPath(rect: rect).cgPath

        /**
         * `CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes);`
         *
         * > This call creates a frame full of glyphs in the shape of the path provided by the `path` parameter. 
         */
        let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: text.count), framePath, layoutAttrDict)

        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: rect.size.height)
        context!.scaleBy(x: 1, y: -1)
        context!.saveGState()

        CTFrameDraw(frame, context!)
    }
}
