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

extension UITextView {
    
    @nonobjc func config(fontSize: CGFloat, fontWeight: CGFloat, textColor: UIColor) -> Self {
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.textColor = textColor
        return self
    }
}

extension UIImageView {
    
    @nonobjc func config(image: UIImage) -> Self {
        self.image = image
        return self
    }
    
}


extension UIButton {
    
    @nonobjc func config(target: AnyObject, selector: Selector, for event: UIControlEvents = .touchUpInside) -> Self {
        self.addTarget(self, action: selector, for: event)
        return self
    }
    
    @nonobjc func configTitle(titleText: String, fontSize: CGFloat, fontWeight: CGFloat, textColor: UIColor) -> Self {
        self.setTitle(titleText, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        return self
    }
    
    @nonobjc func configImage(image: UIImage) -> Self {
        self.setImage(image, for: .normal)
        return self
    }

}

extension UISwitch {
    
    @nonobjc func config(target: AnyObject, selector: Selector) -> Self {
        // Apperance properties don't need to adjustable.
        self.addTarget(target, action: selector, for: .valueChanged)
        self.tintColor = UIColor(white: 0.72, alpha: 1)
        self.onTintColor = UIColor(red: 1, green: 0.267, blue: 0.274, alpha: 1)
        self.backgroundColor = UIColor(white: 0.72, alpha: 1)
        return self
    }
}

extension UIViewController {
    func wrapToNav<T: UINavigationController>() -> T {
        return T.self.init(rootViewController: self)
    }
}


