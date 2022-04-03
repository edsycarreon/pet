import * as bcrypt from "bcrypt";


const cryptPassword = (password: string) => {
    return bcrypt.genSalt(10)
    .then((salt => bcrypt.hash(password, salt)))
    .then(hash => hash);
}
    
const comparePassword = (password: string, hashPassword: string) => {
    return bcrypt.compare(password, hashPassword)
    .then(resp => {
        return resp;
    });
}

export default {
    cryptPassword,
    comparePassword
}
