
import UIKit
import PlaygroundSupport

class PlayViewController : UIViewController {
    
    var yellowView: UIView!
    var redView: UIView!
    
    override func loadView() {        
        // UI        
        let view = UIView()
        view.backgroundColor = .white
        
        yellowView = UIView()
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        
        redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        // Layout
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yellowView.widthAnchor.constraint(equalToConstant: 80),
            yellowView.heightAnchor.constraint(equalToConstant: 80),
            
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            redView.widthAnchor.constraint(equalToConstant: 80),
            redView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

PlaygroundPage.current.liveView = PlayViewController()
