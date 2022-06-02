import * as yup from "yup";

export interface ISignIn {
    email: string;
    password: string;
};

export const schema = yup
    .object({
      email: yup
        .string()
        .email("Email is invalid")
        .required("Email is required"),
      password: yup.string().required("Password is required")});