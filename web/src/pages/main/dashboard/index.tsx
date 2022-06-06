import PetCards from "../../../components/pet-cards";
import { pets } from "../../../data";

const Dashboard = () => {
  const petArray = pets;
  return (
    <>
      <ul
        role="list"
        className="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mt-2"
      >
        {petArray.map((pet, idx) => (
          <PetCards key={idx} id={idx} {...pet} />
        ))}
      </ul>
    </>
  );
};

export default Dashboard;
