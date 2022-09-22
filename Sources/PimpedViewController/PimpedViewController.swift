import UIKit
import ProgressView

open class PimpedViewController: UIViewController {
    var backgroundColor: UIColor = .systemBackground
    var loadingColors: [UIColor] = [.red, .blue, .green]
    
    lazy var loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: loadingColors, lineWidth: 5)
           progress.translatesAutoresizingMaskIntoConstraints = false
           return progress
       }()
       
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressBar()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = backgroundColor
    }
    
    func setupProgressBar() {
           self.view.addSubview(loadingIndicator)
           NSLayoutConstraint.activate([
               loadingIndicator.centerXAnchor
                   .constraint(equalTo: self.view.centerXAnchor),
               loadingIndicator.centerYAnchor
                   .constraint(equalTo: self.view.centerYAnchor),
               loadingIndicator.widthAnchor
                   .constraint(equalToConstant: 50),
               loadingIndicator.heightAnchor
                   .constraint(equalTo: self.loadingIndicator.widthAnchor)
           ])
    }
    
    func showErrorPopUp(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(okBtn)
        present(alert, animated: true)
    }
}
