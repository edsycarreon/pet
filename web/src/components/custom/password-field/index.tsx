import { useState } from "react";
import { AiFillEyeInvisible, AiFillEye } from "react-icons/ai";

interface IPasswordField {
  id?: string;
}

const PasswordField = ({ ...rest }): JSX.Element => {
  const [open, setOpen] = useState<Boolean>(false);

  // handle toggle
  const toggle = () => {
    setOpen(!open);
  };
  return (
    <>
      <div className="mt-1 relative rounded-md shadow-sm">
        <input
          id="confirm-password"
          type={open === false ? "password" : "text"}
          className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-tertiary-main focus:border-tertiary-dark sm:text-sm"
          {...rest}
        />
        <div className="absolute inset-y-0 right-0 pr-3 flex items-center">
          {open === false ? (
            <AiFillEye className="h-5 w-5 text-gray-400" onClick={toggle} />
          ) : (
            <AiFillEyeInvisible
              className="h-5 w-5 text-gray-400"
              onClick={toggle}
            />
          )}
        </div>
      </div>
    </>
  );
};

export default PasswordField;
