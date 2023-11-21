import * as wasm from "est";
import React from "react";
import { useState } from "react";

const CarrickAsync = () => {
  const [carrick, setCarrick] = useState("fooski");
  async function grabCarrick() {
    const theCarrick = await wasm.carrick();
    setCarrick(theCarrick);
  }
  grabCarrick();
  return <p>{carrick}</p>;
};

export default CarrickAsync;
