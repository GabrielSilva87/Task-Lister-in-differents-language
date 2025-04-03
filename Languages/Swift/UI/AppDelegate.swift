import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let taskVC = storyboard.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
        window?.rootViewController = taskVC
        window?.makeKeyAndVisible()
        return true
    }
}