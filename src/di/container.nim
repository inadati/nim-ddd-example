import ../domain/model/character
import ../domain/repository/character_repository
import ../infrastructure/datastore/builtin_character_repository
import ../usecase/character_usecase
import ../presentation/handler/character_handler


type DIContainer = ref object
  dataAll: seq[Character]


proc newDIContainer*(dataAll: seq[Character]): DIContainer =
  return DIContainer(dataAll: dataAll)


proc newCharacterRepository(self: DIContainer): ICharacterRepository =
  return BuiltinCharacterRepository(dataAll: self.dataAll).new()


proc newCharacterUseCase(self: DIContainer): ICharacterUseCase =
  return CharacterUseCase(repository: self.newCharacterRepository()).new()


proc newCharacterHandler(self: DIContainer): ICharacterHandler =
  return CharacterHandler(usecase: self.newCharacterUseCase()).new()



type AppHandler* = ref object
  characterHandler*: ICharacterHandler


proc newAppHandler*(self: DIContainer): AppHandler =
  var appHandler = AppHandler()
  appHandler.characterHandler = self.newCharacterHandler()
  return appHandler
