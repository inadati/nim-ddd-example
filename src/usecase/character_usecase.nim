import ../domain/model/character
import ../domain/repository/character_repository

type ICharacterUseCase* = tuple
  getCharacters: proc(): seq[Character]


type CharacterUseCase* = ref object
  repository*: ICharacterRepository


proc getCharacters(self: CharacterUseCase): seq[Character] =
  return self.repository.fetch()


proc new*(self: CharacterUseCase): ICharacterUseCase =
  return (
    getCharacters: proc(): seq[Character] = self.getCharacters()
  )
