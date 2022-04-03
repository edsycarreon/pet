import { IGlobal } from "./global.interface";

export interface IMeetup extends IGlobal {
    meetupID        :   number,
    personID        :   number,
    petID           :   number,
    type            :   string,
    location        :   number,
    dateAndTime     :   string,
}

export interface IMeetupReview extends IGlobal {
    meetupReviewID  :   number,
    meetupID        :   number,
    rating          :   number,
    comment         :   string
}

export interface IMeetupPhoto extends IGlobal {
    meetupPhotoID   :   number,
    meetupID        :   number,
    title           :   string,
    description     :   string,
    mediaURL        :   string
}