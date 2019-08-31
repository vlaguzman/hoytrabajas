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

export function getTimestamp(date) {
  return getTime(date)
}

export function convertDateToTimestamp(timestamp) {
  return fromUnixTime(timestamp)
}

export const compareArrays = (arr1, arr2) =>
  arr1.length === arr2.length &&
  arr1.sort().every((value, index) => value === arr2.sort()[index])
/**
 * Function to convert hex to rgba
 */
// export function hexToRgbA(hex, alpha) {
//   var c
//   if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)) {
//     c = hex.substring(1).split('')
//     if (c.length === 3) {
//       c = [c[0], c[0], c[1], c[1], c[2], c[2]]
//     }
//     c = '0x' + c.join('')
//     return (
//       'rgba(' +
//       [(c >> 16) & 255, (c >> 8) & 255, c & 255].join(',') +
//       ',' +
//       alpha +
//       ')'
//     )
//   }
//   throw new Error('Bad Hex')
// }

// /**
//  * Text Truncate
//  */
// export function textTruncate(str, length, ending) {
//     if (length == null) {
//         length = 100;
//     }
//     if (ending == null) {
//         ending = '...';
//     }
//     if (str.length > length) {
//         return str.substring(0, length - ending.length) + ending;
//     } else {
//         return str;
//     }
// }

// /**
//  * Get Date
//  */
// export function getTheDate(timestamp, format) {
//     let time = timestamp * 1000;
//     let formatDate = format ? format : 'MM-DD-YYYY';
//     return moment(time).format(formatDate);
// }

// /**
//  * Convert Date To Timestamp
// */
// export function convertDateToTimeStamp(date, format) {
//     let formatDate = format ? format : 'YYYY-MM-DD';
//     return moment(date, formatDate).unix();
// }

// /**
//  * Function to return current app layout
//  */
// export function getAppLayout(url) {
//     let location = url.pathname;
//     let path = location.split('/');
//     return path[1];
// }
