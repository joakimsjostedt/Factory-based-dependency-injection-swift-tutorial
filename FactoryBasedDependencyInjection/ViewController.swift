
import UIKit

protocol MyProtocol {
    func protocolFunction() -> CGFloat
}

class InjectFrameWidth: UIViewController, MyProtocol  {
    func protocolFunction() -> CGFloat{
        return self.view.frame.width/8.0
    }
}

class InjectionClient {
    let delegate: MyProtocol
    init(delegate: MyProtocol) { self.delegate = delegate }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    var width: CGFloat = InjectionClient(delegate: InjectFrameWidth()).delegate.protocolFunction()
    
    override func viewDidLoad() {
        print(width)
    }
}


