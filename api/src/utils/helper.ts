////////////////////////////////////////////////
// isObject()

import { getReasonPhrase, StatusCodes } from "http-status-codes";
import ResStatus from "../classes/ResStatus";

////////////////////////////////////////////////
const isObject = function (o : any) {
    return o === Object(o) && !isArray(o) && typeof o !== 'function';
  };
  
////////////////////////////////////////////////
// toCamel()
////////////////////////////////////////////////
const toCamel = (s : any) => {
  return s.replace(/([-_][a-z])/ig, ($1 : any) => {
    return $1.toUpperCase()
      .replace('-', '')
      .replace('_', '');
  });
};
  
////////////////////////////////////////////////
// isArray()
////////////////////////////////////////////////
const isArray = function (a : any) {
  return Array.isArray(a);
};

////////////////////////////////////////////////
// keysToCamel()
////////////////////////////////////////////////
const keysToCamel = function (o : any) {
    if (isObject(o)) {
      const n : any = {};
  
      Object.keys(o)
        .forEach((k) => {
          n[toCamel(k)] = keysToCamel(o[k]);
        });
  
      return n;
    } else if (isArray(o)) {
      return o.map((i : any) => {
        return keysToCamel(i);
      });
    }
  
    return o;
};

////////////////////////////////////////////////
// getStatusCode()
////////////////////////////////////////////////
const getStatusCode =  (code : any) => {
  const status = new ResStatus(StatusCodes.OK, getReasonPhrase(StatusCodes.OK));
  status.code = code;
  status.description = getReasonPhrase(code);

  return status;
}

export default {
    isObject,
    isArray,
    toCamel,
    keysToCamel,
    getStatusCode
};