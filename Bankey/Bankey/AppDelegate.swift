import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    let dummyVC = DummyVC()
    let mainVC = MainVC()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboardingContainerVC.delegate = self
        dummyVC.logoutDelegate = self
        
        window?.rootViewController = loginVC
        
//        window?.rootViewController = LoginVC()
//        window?.rootViewController = onboardingContainerVC // to hardcode test onboarding
//        window?.rootViewController = OnboardingContainerVC()
//        window?.rootViewController = OnboardingVC(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        mainVC.selectedIndex = 0
        return true
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil, completion: nil)
    }
}
// MARK: Actions
extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        print("foo - Did Login")
//        window?.rootViewController = onboardingContainerVC
        if LocalState.hasOnboarded {
            setRootViewController(mainVC)
        } else {
            setRootViewController(onboardingContainerVC)

        }
//        setRootViewController(onboardingContainerVC)
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        print("foo - Did onboard")
        LocalState.hasOnboarded = true
        setRootViewController(mainVC)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginVC)
    }
}

