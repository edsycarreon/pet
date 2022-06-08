import { BASE_URL } from "../utils/constants";

export const getAllPets = async () => {
  const response = await fetch(BASE_URL + "/pets");
  const data = await response.json();
  return data.pets;
};

export const getPetByID = async (id : string) => {
  const response = await fetch(BASE_URL + `/pets/${id}`);
  const data = await response.json();
  return data.pet;
};