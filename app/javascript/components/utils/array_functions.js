const removeItemFromArr = (arr, item) => {
  const indice = arr.indexOf(item)

  if (indice !== -1) {
    arr.splice(indice, 1)
  }
}

export { removeItemFromArr }
