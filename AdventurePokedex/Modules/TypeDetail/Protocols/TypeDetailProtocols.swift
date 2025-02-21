//  TypeDetailProtocols.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation


// MARK: VIEW -> PRESENTER
protocol TypeDetail_ViewToPresenterProtocol: AnyObject {
	var view: TypeDetail_PresenterToViewProtocol? { get set }
	var interactor: TypeDetail_PresenterToInteractorProtocol? { get set }
	var router: TypeDetail_PresenterToRouterProtocol? { get set }
    func goToTypeDetail(with idType: String)
}


// MARK: PRESENTER -> INTERACTOR
protocol TypeDetail_PresenterToInteractorProtocol: AnyObject {
    var presenter: TypeDetail_InteractorToPresenterProtocol? { get set }
    func goToTypeDetailToInteractor(with idType: String)
}


// MARK: INTERACTOR -> PRESENTER
protocol TypeDetail_InteractorToPresenterProtocol: AnyObject {
    func getToTypeDetailFromInteractor(withDetail detail: TypesDetailResponse)
    func getErrorFromInteractor(withError error: NSError)
}


// MARK: PRESENTER -> VIEW
protocol TypeDetail_PresenterToViewProtocol: AnyObject {
    var presenter: TypeDetail_ViewToPresenterProtocol? { get set }
    func updateView(withDetail detail: TypesDetailResponse)
    func updateErrorService(withError error: NSError)
}


// MARK: PRESENTER -> ROUTER
protocol TypeDetail_PresenterToRouterProtocol: AnyObject {
}
