const maxDate = (date = new Date()) => new Date(date.getFullYear() + 1, date.getMonth(), date.getDate())

export { maxDate }
