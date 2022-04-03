class Res {

    constructor(status: any, resObject: any, resObjectKey: any) {
      return {
        status         : status,
        [resObjectKey] : resObject
      }
    }
  }
  
export default Res;