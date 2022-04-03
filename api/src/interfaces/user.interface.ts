import { IGlobal } from "./global.interface";

export interface IUser extends IGlobal {
    personID        :   number,
    firstName       :   string,
    lastName        :   string,
    email           :   string,
    password        :   string,
    gender          :   string,
    phoneNumber     :   string,
    displayPhoto    :   string,
    status          :   string,
    lastLogin       :   number,
};

export interface IUserAddress extends IGlobal {
    personAddressID :   number,
    personID        :   number,
    street          :   string,
    state           :   string,
    city            :   string,
    zipcode         :   string
}

export interface IUserLevel extends IGlobal {
    personLevelID   :   number,
    personId        :   number,
    level           :   number,
    experience      :   number,
    nextLevel       :   number
}

export interface IUserStats extends IGlobal {
    personStatsID   :   number,
    personId        :   number,
    petsBorrowed    :   number,
    petsLent        :   number
}

