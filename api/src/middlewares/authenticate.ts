import { RequestHandler } from "express";
import jwt from "jsonwebtoken";

export const authenticate : RequestHandler = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader?.split(' ')[1];
    if (token === null) return res.sendStatus(401);

    jwt.verify(token as string ,process.env.ACCESS_TOKEN_SECRET as string, (err, user) => {
        if (err) return res.sendStatus(403);
        // @ts-ignore
        req.user = user;
        next();
    })
};