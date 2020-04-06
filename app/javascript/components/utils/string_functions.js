const cleanJobCategoryDescription = str => {
  let strLowerCase = str.toLowerCase();
  let strWithoutMarks = strLowerCase.replace(",", "");
  let strWithoutSpaces = strWithoutMarks.replace(/ /g, "-");
  let strFinal = strWithoutSpaces.normalize("NFD").replace(/[\u0300-\u036f]/g, "");

  return strFinal;
}

export { cleanJobCategoryDescription }
