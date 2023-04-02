import ../../domain/model/character
import ../../domain/repository/character_repository


type BuiltinCharacterRepository* = ref object
  dataAll*: seq[Character]


proc fetch(self: BuiltinCharacterRepository): seq[Character] =
  return self.dataAll


proc new*(self: BuiltinCharacterRepository): ICharacterRepository =
  return (
    fetch: proc(): seq[Character] = self.fetch()
  )
