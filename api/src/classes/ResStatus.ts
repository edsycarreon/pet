import {
	ReasonPhrases,
	StatusCodes,
	getReasonPhrase,
	getStatusCode,
} from 'http-status-codes';

class ResStatus {
    code : number;
    description : string

    constructor(code = StatusCodes.OK, description = getReasonPhrase(StatusCodes.OK)) {
      this.code = code;
      this.description = description;
    }
}
  
 export default ResStatus;