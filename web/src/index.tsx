import React from "react";
import { createRoot } from "react-dom/client";
import CarrickAsync from "./CarrickAsync";

const App = () => <h1>My React and TypeScript App!</h1>;

const container = document.getElementById("root");
const root = createRoot(container!);
root.render(
  // <React.StrictMode>
  <CarrickAsync />,
  // </React.StrictMode>);
);
//  document.getElementById("root")
