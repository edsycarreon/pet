import React from "react";
import logo from "./logo.svg";
import "./App.css";
import PageRouter from "./routes/routes";
import { QueryClient, QueryClientProvider } from "react-query";
import { ReactQueryDevtools } from "react-query/devtools";

const queryClient = new QueryClient();

function App() {
  return (
    <>
      <QueryClientProvider client={queryClient}>
        <PageRouter />
        <ReactQueryDevtools />
      </QueryClientProvider>
    </>
  );
}

export default App;
