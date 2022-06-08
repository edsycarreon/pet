import { IPets } from "../../../../interfaces/pets.interface";

const PetBio = ({ name, bio, displayPhoto }: IPets): JSX.Element => {
  return (
    <>
      <div className="max-w-md mx-auto bg-white rounded-xl shadow-md overflow-hidden md:max-w-2xl lg:w-[600px]">
        <div className="md:flex lg:h-80">
          <div className="md:shrink-0">
            <img
              className="h-60 w-full object-cover md:h-full md:w-48"
              src={displayPhoto}
              alt="Man looking at item at a store"
            />
          </div>
          <div className="pt-4 px-8">
            <div className="tracking-wide text-lg text-secondary-500 font-semibold">
              {name}
              <span className="ml-2.5 inline-block h-2 w-2 flex-shrink-0 rounded-full bg-green-400">
                <span className="sr-only">Online</span>
              </span>
            </div>
            <div className="w-full">
              <p className="mt-2 text-slate-500">{bio}</p>
              <div className="h-full flex flex-col align-bottom xl:pt-12">
                <div className="mt-5 md:mt-6 lg:grid md:grid-cols-2 sm:gap-2 md:grid-flow-row-dense pb-5 sm:pb-5">
                  <button
                    type="button"
                    className="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm mb-1 xs:mb-2 lg:mb-0 px-4 py-2 bg-indigo-600 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 lg:col-start-2 sm:text-sm"
                    // onClick={() => setOpen(false)}
                  >
                    Deactivate
                  </button>
                  <button
                    type="button"
                    className="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 lg:col-start-1 sm:text-sm"
                    // onClick={() => setOpen(false)}
                    // ref={cancelButtonRef}
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default PetBio;
