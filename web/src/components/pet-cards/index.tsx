import { Link as RouterLink } from "react-router-dom";

interface IPetCard {
  petId: number;
  displayPhoto: string;
  name: string;
  age: number;
  breed: string;
  location: string;
}

const PetCards = ({
  petId,
  displayPhoto,
  name,
  age,
  breed,
  location,
}: IPetCard): JSX.Element => {
  return (
    <>
      <RouterLink to={`/pet/${petId}`}>
        <li className="col-span-1 flex flex-col text-center bg-white rounded-lg shadow divide-y divide-gray-200 transform transition duration-500 hover:scale-105 z-10 cursor-pointer">
          <div className="flex-1 flex flex-col p-8">
            <img
              className="w-48 h-48 mx-auto rounded-full object-cover"
              src={displayPhoto}
              alt="display photo"
            />
            <h3 className="mt-6 text-gray-900 text-sm font-medium">
              {name}, {age.toString()}
              <span className="ml-2.5 inline-block h-2 w-2 flex-shrink-0 rounded-full bg-green-400">
                <span className="sr-only">Online</span>
              </span>
            </h3>
            <dl className="mt-1 flex-grow flex flex-col justify-between">
              <dt className="sr-only">Breed</dt>
              <dd className="text-gray-500 text-sm">{breed}</dd>
              <dt className="sr-only">Location</dt>
              <dd className="mt-3">
                <span className="px-2 py-1 text-secondary-700 text-xs font-medium bg-tertiary-300 rounded-full">
                  {location}
                </span>
              </dd>
            </dl>
          </div>
        </li>
      </RouterLink>
    </>
  );
};

export default PetCards;
