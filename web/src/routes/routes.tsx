import { Route, Routes } from "react-router-dom";
import Skeleton from "../components/main/skeleton";
import Dashboard from "../pages/main/dashboard";
import Matchmaker from "../pages/main/matchmaker";
import Messages from "../pages/main/messages";
import Nearby from "../pages/main/nearby";
import Settings from "../pages/main/settings";
import Statistics from "../pages/main/statistics";
import SignIn from "../pages/signin";
import SignUp from "../pages/signup";

const PageRouter = () => {
  return (
    <>
      <Routes>
        <Route path="/" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />

        <Route element={<Skeleton />}>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/matchmaker" element={<Matchmaker />} />
          <Route path="/nearby" element={<Nearby />} />
          <Route path="/messages" element={<Messages />} />
          <Route path="/statistics" element={<Statistics />} />
          <Route path="/settings" element={<Settings />} />
        </Route>

        <Route path="*" element={<p>404 Not Found</p>} />
      </Routes>
    </>
  );
};
export default PageRouter;
