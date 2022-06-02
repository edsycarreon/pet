import pool from "../db";
import helper from "../utils/helper";

/**
 * getUsers()
 * @returns {Promise<any>}
 */
const getUsers = async () : Promise<any> => {

    const result = await pool.query(`
        SELECT 
            person_id,
            first_name,
            last_name,
            email,
            status,
            phone_number,
            gender,
            display_photo,
            created_by,
            created_at,
            updated_by,
            updated_at 
        FROM person 
        ORDER BY person_id ASC`
    )
    .catch(e => {throw e});

    return helper.keysToCamel(result);
};

/**
 * getUserByID()
 * @param {number} id
 * @returns {Promise<any>}
 */
 const getUserByID = async (id : string) : Promise<any> => {

    const result = await pool.query(`
        SELECT 
            person_id,
            first_name,
            last_name,
            email,
            status,
            phone_number,
            gender,
            display_photo,
            created_by,
            created_at,
            updated_by,
            updated_at 
        FROM person 
        WHERE person_id = $1 
        ORDER BY person_id ASC`, 
    [id])
    .catch(e => {throw e});

    return helper.keysToCamel(result.rows[0]);
};

export default {
    getUsers,
    getUserByID
}