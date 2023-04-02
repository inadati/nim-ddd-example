import ../../domain/model/character
import ../../usecase/character_usecase

type ICharacterHandler* = tuple
  getCharacters: proc(): seq[Character]


type CharacterHandler* = ref object
  usecase*: ICharacterUseCase


proc getCharacters(self: CharacterHandler): seq[Character] =
  return self.usecase.getCharacters()


proc new*(self: CharacterHandler): ICharacterHandler =
  return (
    getCharacters: proc(): seq[Character] = self.getCharacters()
  )
