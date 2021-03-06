import { yupResolver } from "@hookform/resolvers/yup";
import { SubmitHandler, useForm } from "react-hook-form";
import { Link } from "react-router-dom";
import { ISignIn, schema } from "../../interfaces/forms/signin";
import { GiJumpingDog } from "react-icons/gi";
import PasswordField from "../../components/custom/password-field";
import { useMutation, useQueryClient } from "react-query";
import authRequests from "../../services/auth.requests";
import { useNavigate } from "react-router-dom";

type AppProps = {};
const SignIn = (props: AppProps): JSX.Element => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<ISignIn>({ mode: "onBlur", resolver: yupResolver(schema) });

  // history
  const navigate = useNavigate();

  // Mutations
  const mutation = useMutation(authRequests.SignIn, {
    onSuccess: (data: Response) => {
      console.log("data", data);
      navigate("/dashboard");
    },
    onError: (error: Response) => {
      console.log("error", error);
      if (error.status === 401) {
        alert("Invalid credentials");
      }
    },
  });

  const onSubmit: SubmitHandler<ISignIn> = (data) => {
    // Call Request
    mutation.mutate(data);
  };

  return (
    <>
      {/* Main */}
      <div className="min-h-screen flex">
        <div className="flex-1 flex flex-col justify-center py-12 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24">
          <div className="mx-auto w-full max-w-sm lg:w-96">
            {/* Header */}
            <div>
              <GiJumpingDog className="text-6xl" />
              <h2 className="mt-6 text-3xl font-extrabold text-dark-main">
                Welcome to PET!
              </h2>
              <p className="mt-2 text-sm text-dark-main font-medium">
                Sign in to your account
              </p>
            </div>

            {/* Body */}
            <div className="mt-8">
              <div>
                <div>
                  <p className="text-sm font-medium text-dark-main">
                    Sign in with
                  </p>

                  {/* Social Sign In */}
                  <div className="mt-1 grid grid-cols-2 gap-3">
                    {/* Facebook */}
                    <div>
                      <a
                        href="#"
                        className="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-dark-main hover:text-light hover:bg-dark-main"
                      >
                        <span className="sr-only">Sign in with Facebook</span>
                        <svg
                          className="w-5 h-5"
                          aria-hidden="true"
                          fill="currentColor"
                          viewBox="0 0 20 20"
                        >
                          <path
                            fillRule="evenodd"
                            d="M20 10c0-5.523-4.477-10-10-10S0 4.477 0 10c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V10h2.54V7.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V10h2.773l-.443 2.89h-2.33v6.988C16.343 19.128 20 14.991 20 10z"
                            clipRule="evenodd"
                          />
                        </svg>
                      </a>
                    </div>

                    {/* Google */}
                    <div>
                      <a
                        href="#"
                        className="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-dark-main hover:text-light hover:bg-dark-main"
                      >
                        <span className="sr-only">Sign in with Twitter</span>
                        <svg
                          className="w-5 h-5"
                          aria-hidden="true"
                          fill="currentColor"
                          viewBox="0 0 20 20"
                        >
                          <path d="M6.29 18.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0020 3.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.073 4.073 0 01.8 7.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 010 16.407a11.616 11.616 0 006.29 1.84" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>

                <div className="mt-6 relative">
                  <div
                    className="absolute inset-0 flex items-center"
                    aria-hidden="true"
                  >
                    <div className="w-full border-t border-gray-300" />
                  </div>
                  <div className="relative flex justify-center text-sm">
                    <span className="px-2 bg-primary text-dark-main">
                      Or continue with
                    </span>
                  </div>
                </div>
              </div>

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
                        autoComplete="email"
                        placeholder="Enter your email address"
                        required
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-secondary-main focus:border-secondary-700 sm:text-sm"
                        {...register("email")}
                      />
                      <p className="mt-2 text-sm text-red-600">
                        {errors.email?.message}
                      </p>
                    </div>
                  </div>

                  <div className="space-y-1" x-data="{ show: true }">
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

                  <div className="flex items-center justify-between">
                    <div className="flex items-center">
                      <input
                        id="remember-me"
                        name="remember-me"
                        type="checkbox"
                        className="h-4 w-4 text-secondary-700 focus:ring-secondary-main border-gray-300 rounded"
                      />
                      <label
                        htmlFor="remember-me"
                        className="ml-2 block text-sm text-dark-main"
                      >
                        Remember me
                      </label>
                    </div>

                    <div className="text-sm">
                      <a
                        href="#"
                        className="font-medium text-secondary-main hover:text-secondary-700"
                      >
                        Forgot your password?
                      </a>
                    </div>
                  </div>

                  <div>
                    <button
                      type="submit"
                      className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-primary bg-dark-main hover:bg-dark-hover focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-secondary-700"
                    >
                      Sign in
                    </button>
                  </div>
                </form>
              </div>
              <div className="text-center mt-4 text-sm">
                Don't have an account?
                <Link to="/signup">
                  <span className="ml-1 font-bold cursor-pointer text-secondary-main hover:text-secondary-700">
                    Sign Up
                  </span>
                </Link>
              </div>
            </div>
          </div>
        </div>
        <div className="hidden lg:block relative w-0 flex-1">
          <img
            className="absolute inset-0 h-full w-full object-cover"
            src="https://images.unsplash.com/photo-1560743173-567a3b5658b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80"
            alt="two dogs"
          />
        </div>
      </div>
    </>
  );
};

export default SignIn;
