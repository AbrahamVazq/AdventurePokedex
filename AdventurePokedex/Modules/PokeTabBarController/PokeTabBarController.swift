//  PokeTabBarController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 21/01/25.

import UIKit

final class PokeTabBarController: UITabBarController {
    let pokeRedColor: UIColor = UIColor(red: 117/255, green: 31/255, blue: 34/255, alpha: 1)
    
    //MARK: - F U N C T I O N S
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = pokeRedColor
        UITabBar.appearance().barTintColor = pokeRedColor
        tabBar.backgroundColor = pokeRedColor
        tabBar.tintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpViewControllers()
    }
    
    /// Esta funcion nos permite asignar las vistas que va a mostrar el tapBar, con la funcion createNavController
    func setUpViewControllers(){
        viewControllers = [
            createNavController(for:AllPokemonRouter.createModule(),
                                title:NSLocalizedString("Pokemón", comment: ""),
                                image:UIImage(systemName: "magnifyingglass.circle") ?? UIImage()),
            createNavController(for:PokeTypesRouter.createModule(),
                                title:NSLocalizedString("Tipos", comment: ""),
                                image:UIImage(systemName: "list.clipboard") ?? UIImage()),
            createNavController(for:AllRegionRouter.createModule(),
                                title:NSLocalizedString("Tipos", comment: ""),
                                image:UIImage(systemName: "globe") ?? UIImage())
        ]
    }

    /// Esta funcion nos devuelve un UIViewController el cual va a poder ser navegable en el TapBat
    /// - Parameters:
    ///   - rootVC: Esta vista es la que va a contener al tapBar
    ///   - title: Titulo que va a tener el elemento en el tapBar
    ///   - image: Una imagen para pintar en el tapBar
    /// - Returns: Un viewController listo para ser consultado en el TapBar
    fileprivate func createNavController(for rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC )
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.titleTextAttributes = [.foregroundColor: pokeRedColor]
        rootVC.navigationItem.title = title
        return navController
    }
}
