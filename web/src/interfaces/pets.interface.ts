export interface IPets {
  petId: number;
  name : string;
  species : string;
  breed : string;
  displayPhoto : string;
  gender : string;
  age : number;
  bio : string;
  location: string;
  photos: {
    title: string;
    description: string;
    mediaUrl: string
  }[];
}