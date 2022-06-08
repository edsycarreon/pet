import PetCards from "../../../components/pet-cards";

import { useQuery } from "react-query";
import { getAllPets } from "../../../services/requests";
import { IPets } from "../../../interfaces/pets.interface";

const Dashboard = () => {
  const { data, status, isLoading, isIdle, error } = useQuery<IPets[], Error>(
    "pets",
    getAllPets
  );

  if (isLoading || isIdle) {
    return <h1>Loading...</h1>;
  }

  if (error) {
    return <h1>{error!.message}</h1>;
  }

  return (
    <>
      <ul
        role="list"
        className="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mt-2"
      >
        {data.map((pet, idx) => (
          <PetCards key={pet.petId} {...pet} />
        ))}
      </ul>
    </>
  );
};

export default Dashboard;
