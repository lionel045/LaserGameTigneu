import Foundation
import Combine

final class AppFormulaDIContainer {
    
    // MARK: - Services
    
    private lazy var serviceStorageManager: ServiceStorageProtocol = ServiceStorageManager()
    
    private lazy var serviceFirestoreFormulaDb: ServiceFormulaDbProtocol = ServiceFirestoreFormulaDb()
    
    // MARK: - Repositories
    
    private lazy var formulaRepository: FormulaRepositoryInterface = FormulaRepositoryImpl(
        imageDataSource: serviceStorageManager,
        formulaDataSource: serviceFirestoreFormulaDb
    )
    
    // MARK: - Use Cases
    
    private lazy var getFormulaUseCase: GetFormulasUseCaseInterface = GetFormulaUseCase(repo: formulaRepository)
    
    // MARK: - ViewModels
    
     lazy var formulaViewModel: FormulaViewModel = FormulaViewModel(formulaUseCase: getFormulaUseCase)
    
    

}
