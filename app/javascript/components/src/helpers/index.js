import formatDate from 'date-fns/format'
import { es, enUS as en } from 'date-fns/locale'
import getTime from 'date-fns/getTime'
import fromUnixTime from 'date-fns/fromUnixTime'

const locales = { en, es }

export function format(date, formatString = 'dd MMM yyyy') {
  return formatDate(date, formatString, {
    // eslint-disable-next-line
    locale: es
  })
}

export function capitalize(string) {
  return string.replace(/(?:^|\s)\S/g, a => a.toUpperCase())
}

export function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1)
}

export function getTimestamp(date) {
  return getTime(date)
}

export function convertDateToTimestamp(timestamp) {
  return fromUnixTime(timestamp)
}

export const compareArrays = (arr1, arr2) =>
  arr1.length === arr2.length &&
  arr1.sort().every((value, index) => value === arr2.sort()[index])
