//
//  UIFactory.swift
//  SingingVoice
//
//  Created by 黄延 on 16/9/26.
//  Copyright © 2016年 黄延. All rights reserved.
//

import SnapKit


extension UIColor {
    class func RGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 100) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 100)
    }
    
    class func HEX(_ c: Int) -> UIColor {
        return RGB(r: CGFloat(c>>16), g: CGFloat((c>>8) & 0xff), b: CGFloat(c & 0xff))
    }
}

extension UIView {
    
    // chained creation of views
    
    @nonobjc func addSubview<T: UIView>(_ type: T.Type) -> T {
        let subview = type.self.init()
        addSubview(subview)
        return subview
    }
    
    @nonobjc func addSubling<T: UIView>(_ type: T.Type) -> T {
        assert(superview != nil, "Cant add subling view to a view without a parent")
        let subling = type.self.init()
        superview?.addSubview(subling)
        return subling
    }
    
    // chained configuration
    
    @nonobjc func config(backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    // chained layout
    
    @nonobjc func layout( _ closure: (ConstraintMaker) -> ()) -> Self {
        self.snp.makeConstraints(closure)
        return self
    }
    
    @nonobjc func set(frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
}

extension UILabel {
    
    @nonobjc func config(fontSize: CGFloat, fontWeight: CGFloat, textColor: UIColor) -> Self {
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.textColor = textColor
        return self
    }
    
    @nonobjc func textArrage(alignment: NSTextAlignment, mulitLine: Bool) -> Self {
        self.textAlignment = alignment
        self.numberOfLines = mulitLine ? 0: 1
        return self
    }
    
}

extension UITextField {
    
    @nonobjc func config(fontSize: CGFloat, fontWeight: CGFloat, textColor: UIColor) -> Self {
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.textColor = textColor
        return self
    }
    
}

extension UIImageView {
    
}


