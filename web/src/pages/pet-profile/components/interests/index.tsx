import { IPets } from "../../../../data";

const PetInterests = ({ photos }: IPets): JSX.Element => {
  return (
    <>
      <div className="max-w-md bg-white rounded-xl shadow-md overflow-hidden md:max-w-lg">
        {/* Header */}
        <div className="px-4 py-5 sm:px-6">
          <h3 className="text-lg leading-6 font-medium text-gray-900">
            Photos
          </h3>
        </div>
        {/* Body */}
        <section className="overflow-hidden text-gray-700 border-t">
          <div className="container px-3 py-2 mx-auto lg:px-3">
            <div className="flex flex-wrap -m-1 md:-m-2">
              {photos.map((photo) => {
                return (
                  <div className="flex flex-wrap w-1/3">
                    <div className="w-full p-1 md:p-2 transform transition duration-500 hover:scale-105 z-10 cursor-pointer">
                      <img
                        alt={photo.name}
                        className="block object-cover object-center w-full h-full rounded-lg"
                        src={photo.url}
                      />
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </section>
        {/* <ul
          role="list"
          className="grid grid-cols-2 gap-x-4 gap-y-8 sm:grid-cols-3 sm:gap-x-6 lg:grid-cols-4 xl:gap-x-8"
        >
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
          <li key="" className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img
                src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(72).webp"
                alt=""
                className="object-cover pointer-events-none group-hover:opacity-75"
              />
            </div>
          </li>
        </ul> */}
      </div>
    </>
  );
};

export default PetInterests;
