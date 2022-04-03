import pool from "../db";
import { IUser } from "../interfaces/user.interface";
import helper from "../utils/helper";

/**
 * signUp()
 * @param {IUser} userParams
 * @returns {Promise<any>}
 */
const signUp = async (userPrams : IUser) : Promise<any> => {

    const {
        firstName,
        lastName,
        email,
        password,
        gender,
        status,
        phoneNumber,
        displayPhoto
    } = userPrams;

    const result = await pool.query(`
        INSERT INTO person (
            first_name,
            last_name,
            email,
            password,
            gender,
            status,
            phone_number,
            display_photo,
            created_by
        ) VALUES (
            $1,
            $2,
            $3,
            $4,
            $5,
            $6,
            $7,
            $8,
            lastval()
        ) RETURNING *;
    `,
    [firstName, lastName, email, password, gender, status, phoneNumber, displayPhoto])
    .catch(e => {throw e});

    return helper.keysToCamel(result);
};

/**
 * getCredentialsByEmail()
 * @param {string} email
 * @returns {Promise<any>}
 */
 const getCredentialsByEmail = async (email : string) : Promise<any> => {

    const result = await pool.query(`
        SELECT 
            person_id,
            email,
            password
        FROM person 
        WHERE email = $1 
        ORDER BY person_id ASC`, 
    [email])
    .catch(e => {throw e});

    return helper.keysToCamel(result.rows);
};

/**
 * updateRefreshToken()
 * @param {string} refreshToken
 * @param {string} id
 * @returns {Promise<any>}
 */
 const updateRefreshToken = async (refreshToken : string, id : string) : Promise<any> => {

    const result = await pool.query(`
        UPDATE person
        SET
            refresh_token = $1
        WHERE person_id = $2
        RETURNING *;
    `, 
    [refreshToken,id])
    .catch(e => {throw e});

    return helper.keysToCamel(result.rows);
};

export default {
    signUp,
    getCredentialsByEmail,
    updateRefreshToken
};