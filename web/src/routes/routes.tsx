import { Route, Routes } from "react-router-dom";
import SignIn from "../pages/signin";
import SignUp from "../pages/signup";

const PageRouter = () => {
  return (
    <>
      <Routes>
        <Route path="/" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />
        <Route path="*" element={<p>404 Not Found</p>} />
      </Routes>
    </>
  );
};
export default PageRouter;
