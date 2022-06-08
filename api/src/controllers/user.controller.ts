import express, { RequestHandler } from "express";

// Services
import userService  from "../services/user.service";

//Classes
import ResStatus from "../classes/ResStatus";
import Res from "../classes/Res";

//Utils
import helper from "../utils/helper";

//3rd party
import {
	StatusCodes,
	getReasonPhrase,
} from 'http-status-codes';


/**
 * getUsers()
 * fetch all users
 */
const getUsers : RequestHandler = async (req, res) => {

    let status = new ResStatus();

    const users = await userService.getUsers()
    .catch(e => {
        console.error("Error",e);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR);
        status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
        res.send(status);
    });

    if(users.length <= 0) {
        res.status(StatusCodes.NOT_FOUND);
        status = helper.getStatusCode(StatusCodes.NOT_FOUND.toString());
    }
    const resUser = new Res(status, users, 'users');
    res.send(resUser);
};

/**
 * getUserByID()
 * fetch a user by its ID
 * @param {int} id
 */
const getUserByID : RequestHandler = async (req, res) => {

    const { id } = req.params;

    let status = new ResStatus();
    
    const user = await userService.getUserByID(id)
    .catch(e => {
        console.error("Error",e);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR);
        status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
        res.send(status);
    });

    // const {rows} = user;

    if(!user) {
        res.status(StatusCodes.NOT_FOUND);
        status = helper.getStatusCode(StatusCodes.NOT_FOUND.toString());
    }
    const resUser = new Res(status, user, 'user');
    res.send(resUser);
}
  
export default {
    getUsers,
    getUserByID
};