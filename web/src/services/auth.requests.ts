import { ISignIn } from "../interfaces/forms/signin";
import { BASE_URL } from "../utils/constants";

const SignIn = async (body : ISignIn) => {
  const response = await fetch(BASE_URL + "/auth/signin", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })
  if(!response.ok) throw response;
  
  const data = await response.json();

  return data.tokens;
}


export default {
  SignIn
}

