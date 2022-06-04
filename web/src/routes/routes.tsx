import { Route, Routes } from "react-router-dom";
import Skeleton from "../components/main/skeleton";
import SignIn from "../pages/signin";
import SignUp from "../pages/signup";

const PageRouter = () => {
  return (
    <>
      <Routes>
        <Route path="/" element={<SignIn />} />

        <Route element={<Skeleton />}>
          <Route path="/signup" element={<SignUp />} />
        </Route>

        <Route path="*" element={<p>404 Not Found</p>} />
      </Routes>
    </>
  );
};
export default PageRouter;
