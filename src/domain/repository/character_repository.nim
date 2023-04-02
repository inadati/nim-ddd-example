import ../model/character

type ICharacterRepository* = tuple
  fetch: proc(): seq[Character]
