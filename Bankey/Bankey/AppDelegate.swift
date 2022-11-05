import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboardingContainerVC.delegate = self
//        window?.rootViewController = LoginVC()
        window?.rootViewController = onboardingContainerVC
//        window?.rootViewController = OnboardingContainerVC()
//        window?.rootViewController = OnboardingVC(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        return true
    }
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        print("foo - DId Login")
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        print("foo - Did onboard")
    }
}
