//  AllRegionProtocols.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

// MARK: VIEW -> PRESENTER
protocol AllRegion_ViewToPresenterProtocol: AnyObject {
	var view: AllRegion_PresenterToViewProtocol? { get set }
	var interactor: AllRegion_PresenterToInteractorProtocol? { get set }
	var router: AllRegion_PresenterToRouterProtocol? { get set }
    
    func goToTypes()
}


// MARK: PRESENTER -> INTERACTOR
protocol AllRegion_PresenterToInteractorProtocol: AnyObject {
    var presenter: AllRegion_InteractorToPresenterProtocol? { get set }
    
    func goToTypesToInteractor()
}


// MARK: INTERACTOR -> PRESENTER
protocol AllRegion_InteractorToPresenterProtocol: AnyObject {
    func getToAllRegionFromInteractor(withRegions regions: AllRegionResponse)
    
    func getErrorFromInteractor(withError error: NSError)
}


// MARK: PRESENTER -> VIEW
protocol AllRegion_PresenterToViewProtocol: AnyObject {
    var presenter: AllRegion_ViewToPresenterProtocol? { get set }
    
    func updateView(WithRegions regions: AllRegionResponse)
    
    func updateErrorService(withError error: NSError)
}


// MARK: PRESENTER -> ROUTER
protocol AllRegion_PresenterToRouterProtocol: AnyObject {
}
