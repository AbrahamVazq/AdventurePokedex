//  TypeDetailPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class TypeDetailPresenter: TypeDetail_ViewToPresenterProtocol {
    
    weak var view: TypeDetail_PresenterToViewProtocol?
    var interactor: TypeDetail_PresenterToInteractorProtocol?
    var router: TypeDetail_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension TypeDetailPresenter: TypeDetail_InteractorToPresenterProtocol {

}
