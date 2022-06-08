import pool from "../db";
import helper from "../utils/helper";

/**
 * getAllPets()
 * @returns {Promise<any>}
 */
const getAllPets = async () : Promise<any> => {
  
  const result = await pool.query(`
    SELECT
      pet_id,
      person_id,
      name,
      bio,
      species,
      breed,
      age,
      gender,
      location,
      display_photo,
      created_at,
      created_by,
      updated_at,
      updated_by
    FROM pet
    ORDER BY pet_id ASC
  `).catch(e => {throw e});

  return helper.keysToCamel(result.rows);
}

/**
 * getPetByID()
 * @returns {Promise<any>}
 */
 const getPetByID = async (id : string) : Promise<any> => {
  
  const result = await pool.query(`
    SELECT
      pet_id,
      person_id,
      name,
      bio,
      species,
      breed,
      age,
      gender,
      location,
      display_photo,
      created_at,
      created_by,
      updated_at,
      updated_by
    FROM pet
    WHERE pet_id = $1 
    ORDER BY pet_id ASC
  `,[id]).catch(e => {throw e});

  return helper.keysToCamel(result.rows[0]);
}

/**
 * getPetPhotosByID()
 * @returns {Promise<any>}
 */
 const getPetPhotosByID = async (id : string) : Promise<any> => {
  
  const result = await pool.query(`
    SELECT
      pet_photo_id
      pet_id,
      title,
      description,
      media_url,
      created_at,
      created_by,
      updated_at,
      updated_by
    FROM pet_photo
    WHERE pet_id = $1 
    ORDER BY pet_id ASC
  `,[id]).catch(e => {throw e});

  return helper.keysToCamel(result.rows);
}

export default {
  getAllPets,
  getPetByID,
  getPetPhotosByID
}