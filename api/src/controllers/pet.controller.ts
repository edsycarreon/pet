import express, { RequestHandler } from "express";

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

import { IPet } from "../interfaces/pet.interface";

import petService from "../services/pet.service";

/**
 * getAllPets()
 * @description fetch all pets
 */
const getAllPets : RequestHandler = async (req, res) => {

  let status = new ResStatus();
  let result : IPet[];

  // Get All Pets Service
  const pets = await petService.getAllPets()
    .catch(e => {
      console.error("Error",e);
      res.status(StatusCodes.INTERNAL_SERVER_ERROR);
      status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
      res.send(status);
    });

  if(pets.length <= 0) {
    res.status(StatusCodes.NOT_FOUND);
    status = helper.getStatusCode(StatusCodes.NOT_FOUND.toString());
  }

  result = pets

  const resPets = new Res(status, result, 'pets');
    res.send(resPets);
}

/**
 * getPetByID()
 * @description fetch pet by id
 * @param {int} id
 */
const getPetByID : RequestHandler = async (req, res) => {

  const { id } = req.params;

  let status = new ResStatus();
  let result : IPet;

  // Get All Pets Service
  const pets = await petService.getPetByID(id)
    .catch(e => {
      console.error("Error",e);
      res.status(StatusCodes.INTERNAL_SERVER_ERROR);
      status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
      res.send(status);
    });

  if(!pets) {
    res.status(StatusCodes.NOT_FOUND);
    status = helper.getStatusCode(StatusCodes.NOT_FOUND.toString());
  }

  // Set the response to result object
  result = pets;

  // Get pet photos
  const photos = await petService.getPetPhotosByID(id)
    .catch(e => {
      console.error("Error",e);
      res.status(StatusCodes.INTERNAL_SERVER_ERROR);
      status = helper.getStatusCode(StatusCodes.INTERNAL_SERVER_ERROR.toString());
      res.send(status);
    });

  if(photos) {
    result.photos = photos
  }

  const resPet = new Res(status, result, 'pet');
    res.send(resPet);
}

export default {
  getAllPets,
  getPetByID
}