import { useParams } from "react-router-dom";
import PetBio from "./components/bio";
import PetInformation from "./components/information";
import PetInterests from "./components/interests";
import { pets, IPets } from "../../data";

const PetProfile = (): JSX.Element => {
  const { id } = useParams();
  console.log("ID", id);

  // Simulate API call
  const data: IPets = pets.filter((_, idx) => parseInt(id || "") == idx)[0];

  console.log(data);
  return (
    <>
      <div className="flex justify-center">
        <div className="flex flex-col">
          <div className="flex flex-col lg:flex-row">
            <div className="mr-5">
              <PetBio {...data} />
            </div>
            <div className="mr-5 mt-5 lg:mt-0">
              <PetInformation {...data} />
            </div>
          </div>
          <div className="mt-5">
            <PetInterests {...data} />
          </div>
        </div>
      </div>
    </>
  );
};

export default PetProfile;
