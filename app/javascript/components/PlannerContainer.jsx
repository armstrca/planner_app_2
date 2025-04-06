import React from "react";
import { WDay } from "./WDay";
import { WDayLast } from "./WDayLast";

export const PlannerContainer = () => {
  return (
    <div className="bg-white flex flex-row justify-center w-full">
      <div className="bg-white w-[960px] h-[1440px]">
        <div className="relative w-[900px] h-[1373px] top-[13px] left-[30px] bg-[url(https://c.animaapp.com/eFfbxFd7/img/header-footer-1.svg)] bg-[100%_100%]">
          <WDayLast className="!absolute !left-0 !top-[1140px]" />
          <WDay className="!absolute !left-0 !top-[510px]" />
          <WDay className="!absolute !left-0 !top-[720px]" />
          <WDay className="!absolute !left-0 !top-[930px]" />
          <WDay className="!absolute !left-0 !top-[300px]" />
          <WDay className="!absolute !left-0 !top-[90px]" />
        </div>
      </div>
    </div>
  );
};
