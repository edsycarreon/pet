import jwt from "jsonwebtoken";

const generateAccessToken = (user : object) => {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET as string, { expiresIn: '15s' });
}

const generateRefreshToken = (user : object) => {
    return jwt.sign(user, process.env.REFRESH_TOKEN_SECRET as string, { expiresIn: '7h' });
}

export default {
    generateAccessToken,
    generateRefreshToken
}