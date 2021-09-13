import UIKit

extension UIView {
    
    enum Direction: Int {
        case topToBottom = 0
        case bottomToTop
        case leftToRight
        case rightToLeft
    }
    
    static var defaultGradientColors = [UIColor.black,
                                        UIColor(white: 0, alpha: 0.1),
                                        UIColor.black]
    
    func startShimmeringAnimation(backgroundColor: UIColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.18),
                                  gradientColors: [UIColor] = defaultGradientColors,
                                  animationSpeed: Float = 1.4,
                                  direction: Direction = .leftToRight,
                                  repeatCount: Float = MAXFLOAT) {
        self.backgroundColor = backgroundColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors.map({ $0.cgColor })
        gradientLayer.frame = CGRect(x: -self.bounds.size.width, y: -self.bounds.size.height, width: 3 * self.bounds.size.width, height: 3 * self.bounds.size.height)
        
        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        }
        
        gradientLayer.locations =  [0.35, 0.50, 0.65]
        self.layer.mask = gradientLayer
        
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = CFTimeInterval(animationSpeed)
        animation.repeatCount = repeatCount
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else { return }
            self.layer.mask = nil
        }
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        CATransaction.commit()
    }
    
    func stopShimmeringAnimation() {
        layer.mask = nil
    }
}
