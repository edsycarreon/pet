import express, { RequestHandler } from "express";

// Services
import authService from "../services/auth.service";

//Classes
import ResStatus from "../classes/ResStatus";
import Res from "../classes/Res";

//Utils
import helper from "../utils/helper";
import bcrypt from "../utils/bcrypt";
import { STATUS } from "../utils/constants";

//3rd party
import {
	StatusCodes,
	getReasonPhrase,
} from 'http-status-codes';
import jwt from "jsonwebtoken";

//Interfaces
import { IUser } from "../interfaces/user.interface";
import auth from "../utils/auth";
import userService from "../services/user.service";

/**
 * signUp()
 * @description creates an account for the customer
 * @param {string} body.firstName
 * @param {string} body.lastName
 * @param {string} body.email
 * @param {string} body.gender
 * @param {string} body.phoneNumber
 * @param {string} body.displayPhoto
 */
const signUp : RequestHandler = async(req, res) => {
    //Get request body
    const userParams : IUser = req.body;

    //Set status to active
    userParams.status = STATUS.ACTIVE;

    //Encrypt password with bcrypt
    const ecryptedPassword = await bcrypt.cryptPassword(userParams.password);

    //Set encrypted password as password
    userParams.password = ecryptedPassword;

    //Initialize status code
    let status = new ResStatus(StatusCodes.CREATED, getReasonPhrase(StatusCodes.CREATED));
    res.status(StatusCodes.CREATED)

    //Call signUp() service
    const user = await authService.signUp(userParams)
    .catch(e => {
        console.error("Error",e);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR);
        status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
        res.send(status);
    });

    //Null check
    if(!user) {
        res.status(StatusCodes.NOT_FOUND);
        status = helper.getStatusCode(StatusCodes.NOT_FOUND.toString());
    }

    //Finalize returned value
    const resUser = new Res(status, helper.keysToCamel(user), 'user');
    res.send(resUser);
};

/**
 * signIn()
 * @description signs in a user
 * @param {Object} body
 * @param {string} body.email
 * @param {string} body.password
 */
 const signIn : RequestHandler = async(req, res) => {
    //Get request body
    const userParams : IUser = req.body;

    //Initialize status code
    let status = new ResStatus(StatusCodes.OK, getReasonPhrase(StatusCodes.OK));
    res.status(StatusCodes.OK)

    //Call getCredentialByEmail() service
    const credentials = await authService.getCredentialsByEmail(userParams.email)
    .catch(e => {
        console.error("Error", e);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR);
        status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
        res.send(status);
    });

    //Null check
    if(!credentials) {
        res.status(StatusCodes.UNAUTHORIZED);
        status = helper.getStatusCode(StatusCodes.UNAUTHORIZED.toString());
        res.send(status)
    }

    //Decrypt and compare password with bcrypt
    const isPasswordMatched = await bcrypt.comparePassword(userParams.password, credentials.password);

    if(!isPasswordMatched) {
        res.status(StatusCodes.UNAUTHORIZED);
        status = helper.getStatusCode(StatusCodes.UNAUTHORIZED.toString());
        res.send(status);
    }

    //Create access and refresh tokens
    const serializedUser = { email: credentials.email, id: credentials.personId };
    const accessToken = auth.generateAccessToken(serializedUser);
    const refreshToken = auth.generateRefreshToken(serializedUser);
    const returnedTokend = { accessToken, refreshToken};

    //Finalize returned value
    const resUser = new Res(status, returnedTokend, 'tokens');
    res.send(resUser);
};

/**
 * refreshToken()
 * @description refreshes the user's access token.
 * @param {string} token
 */
const refreshToken : RequestHandler = async (req, res) => {

    //get request body
    const accessToken = req.body.accessToken;
    const refreshToken = req.body.refreshToken;

    //initialize status code
    let status = new ResStatus(StatusCodes.OK, getReasonPhrase(StatusCodes.OK));
    res.status(StatusCodes.OK)

    //check if refresh token is passed as body
    if (!refreshToken) {
        res.status(StatusCodes.UNAUTHORIZED);
        status = helper.getStatusCode(StatusCodes.UNAUTHORIZED.toString());
        res.send(status);
    };

    //decode token
    jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET as string, async (err : any, user : any) =>  {
        if (err) {
            res.status(StatusCodes.FORBIDDEN);
            status = helper.getStatusCode(StatusCodes.FORBIDDEN.toString());
            res.send(status);
        };

        //get user
        const userInfo = await userService.getUserByID(user.id)
            .catch(e => {
            res.status(StatusCodes.INTERNAL_SERVER_ERROR);
            status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
            res.send(status);
        });

        const {rows} = userInfo;

        //check if user matches.
        if (rows[0].email != user.email) {
            res.status(StatusCodes.UNAUTHORIZED);
            status = helper.getStatusCode(StatusCodes.UNAUTHORIZED.toString());
            res.send(status);
        }
        
        const accessToken = auth.generateAccessToken({email: user.email, id: user.id});
        const resToken = new Res(status, accessToken, 'token');
        res.send(resToken);
    });
};

export default {
    signUp,
    signIn,
    refreshToken
}