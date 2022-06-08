import { IGlobal } from "./global.interface";

export interface IPet extends IGlobal {
    petID?          :   number;
    personID?       :   number;
    name?           :   string;
    bio?            :   string;
    species?        :   string;
    breed?          :   string;
    age?            :   number;
    gender?         :   string;
    displayPhoto?   :   string;
    location?       :   string;
    photos?         :   IPetPhoto[]
};

export interface IPetPhoto extends IGlobal {
    petPhotoID?      :   number;
    petID?           :   number;
    title?           :   string;
    description?     :   string;
    mediaURL?        :   string;
};