import { useState } from "react";
import ImageViewer from "../../../../components/image-viewer";
import { IPets } from "../../../../interfaces/pets.interface";

const PetInterests = ({ photos }: IPets): JSX.Element => {
  const [image, setImage] = useState({ mediaUrl: "", title: "" });
  const [show, setShow] = useState<boolean>(false);
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
              {photos.length > 0 ? (
                photos.map((photo) => {
                  return (
                    <div className="flex flex-wrap w-1/3">
                      <div className="w-full p-1 md:p-2 transform transition duration-500 hover:scale-105 z-10 cursor-pointer">
                        <img
                          onClick={() => {
                            setImage({ ...photo });
                            setShow(true);
                          }}
                          alt={photo.title}
                          className="block object-cover object-center w-full h-full rounded-lg"
                          src={photo.mediaUrl}
                        />
                      </div>
                    </div>
                  );
                })
              ) : (
                <div className="flex justify-center items-center h-72 w-full">
                  <p className="text-3xl text-gray-400">No photos</p>
                </div>
              )}
            </div>
          </div>
        </section>
      </div>
      <ImageViewer
        show={show}
        onClose={() => setShow(false)}
        mediaUrl={image.mediaUrl}
        title={image.title}
      />
    </>
  );
};

export default PetInterests;
