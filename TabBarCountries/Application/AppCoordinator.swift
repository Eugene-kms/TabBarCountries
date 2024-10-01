import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = UIColor.black.withAlphaComponent(0.25)
        
        let config = CountriesNetworkConfig()
        let networkService = NetworkService(config: config)
        let repository = CountriesRepository(networkService: networkService)
        let viewModel = HomeViewModel(repository: repository)
        let viewController = HomeController(viewModel: viewModel)
        
        tabBarController.viewControllers = [
            setupTabBarViewController("Home", "house", .white, viewController),
            setupTabBarViewController("Files", "folder", .blue),
            setupTabBarViewController("Messages", "paperplane", .green),
            setupTabBarViewController("Archive", "archivebox", .red),
            setupTabBarViewController("Documents", "doc.text", .orange)
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func setupTabBarViewController(
        _ title: String,
        _ iconSystemName: String,
        _ backgroundColor: UIColor,
        _ viewController: UIViewController = UIViewController()
    ) -> UIViewController {
        viewController.view.backgroundColor = backgroundColor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: iconSystemName),
            tag: 0
        )
        return viewController
    }
}

