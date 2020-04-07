const cleanJobCategoryDescription = str => {
  const strLowerCase = str.toLowerCase()
  const strWithoutMarks = strLowerCase.replace(',', '')
  const strWithoutSpaces = strWithoutMarks.replace(/ /g, '-')
  const strFinal = strWithoutSpaces
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')

  return strFinal
}

export { cleanJobCategoryDescription }
