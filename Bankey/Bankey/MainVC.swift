import UIKit

class MainVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let summaryVC   = AccountSummaryVC()
        let moneyVC     = MoveMoneyVC()
        let moreVC      = MoreVC()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC   = UINavigationController(rootViewController: summaryVC)
        let moneyNC     = UINavigationController(rootViewController: moneyVC)
        let moreNC       = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}
//Dummy VC before ive created full new AccountSummaryVC
//class AccountSummaryVC: UIViewController {
//    override func viewDidLoad() {
//        view.backgroundColor = .systemGreen
//    }
//}

class MoveMoneyVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
