import * as yup from "yup";
import { REGEX } from "../../utils/constants";

export interface ISignUp {
    email: string;
    password: string;
    confirmPassword: string;
};

export const schema = yup
    .object({
      email: yup
        .string()
        .email("Email is invalid")
        .required("Email is required"),
      password: yup.string().required("Password is required")
        .min(8,"Password must at least be 8 characters")
        .matches(REGEX.NUMBERS, "Password must contain at least one number")
        .matches(REGEX.LOWER_CASE_LETTERS, "Password must contain at least lowercase letter")
        .matches(REGEX.UPPER_CASE_LETTERS, "Password must contain at least uppercase letter")
        .matches(REGEX.SPECIAL_CHARACTERS, "Password must contain at least one special character"),
      confirmPassword: yup
        .string()
        .required("Confirm Password is required")
        .oneOf([yup.ref("password"), null], "Password and Confirm Password must match"),
    })
    .required();