import { Link } from "react-router-dom";
import { useForm, SubmitHandler } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { ISignUp, schema } from "../../interfaces/forms/signup";
import { GiJumpingDog } from "react-icons/gi";
import PasswordField from "../../components/custom/password-field";

type AppProps = {};

const SignUp = (props: AppProps): JSX.Element => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<ISignUp>({ mode: "onBlur", resolver: yupResolver(schema) });
  const onSubmit: SubmitHandler<ISignUp> = (data) => console.log(data);

  return (
    <>
      <div className="min-h-screen flex">
        <div className="flex-1 flex flex-col justify-center py-12 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24">
          <div className="mx-auto w-full max-w-sm lg:w-96">
            <div>
              <GiJumpingDog className="text-6xl" />
              <h2 className="mt-6 text-3xl font-extrabold text-dark-main">
                Welcome to PET!
              </h2>
              <p className="mt-2 text-sm text-dark-main font-medium">
                Create your account.
              </p>
            </div>

            <div className="mt-8">
              <div className="mt-6">
                <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
                  <div>
                    <label
                      htmlFor="email"
                      className="block text-sm font-medium text-dark-main"
                    >
                      Email address
                    </label>
                    <div className="mt-1">
                      <input
                        id="email"
                        type="email"
                        placeholder="Enter your email address"
                        autoComplete="email"
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-tertiary-main focus:border-tertiary-dark sm:text-sm"
                        {...register("email")}
                      />
                      <p className="mt-2 text-sm text-red-600">
                        {errors.email?.message}
                      </p>
                    </div>
                  </div>

                  <div className="space-y-1">
                    <label
                      htmlFor="password"
                      className="block text-sm font-medium text-dark-main"
                    >
                      Password
                    </label>
                    <div className="mt-1">
                      <PasswordField
                        id="password"
                        placeholder="Enter your password"
                        autoComplete="current-password"
                        name="password"
                        register={register}
                      />
                      <p className="mt-2 text-sm text-red-600">
                        {errors.password?.message}
                      </p>
                    </div>
                  </div>

                  <div className="space-y-1">
                    <label
                      htmlFor="confirmPassword"
                      className="block text-sm font-medium text-dark-main"
                    >
                      Confirm Password
                    </label>
                    <div className="mt-1">
                      <PasswordField
                        id="confirm-password"
                        placeholder="Confirm your password"
                        autoComplete="current-password"
                        name="confirmPassword"
                        register={register}
                      />
                      <p className="mt-2 text-sm text-red-600">
                        {errors.confirmPassword?.message}
                      </p>
                    </div>
                  </div>

                  <div>
                    <button
                      type="submit"
                      className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-primary bg-dark-main hover:bg-dark-hover focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-tertiary-dark"
                    >
                      Sign Up
                    </button>
                  </div>
                </form>
              </div>
              <div className="text-center mt-4 text-sm">
                Already have an account?
                <Link to="/">
                  <span className="ml-1 font-bold cursor-pointer text-tertiary-main hover:text-tertiary-dark">
                    Sign In
                  </span>
                </Link>
              </div>
            </div>
          </div>
        </div>
        <div className="hidden lg:block relative w-0 flex-1">
          <img
            className="absolute inset-0 h-full w-full object-cover"
            src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80"
            alt="two dogs"
          />
        </div>
      </div>
    </>
  );
};

export default SignUp;
