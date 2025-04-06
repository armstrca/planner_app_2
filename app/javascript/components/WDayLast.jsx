/*
We're constantly improving the code you see. 
Please share your feedback here: https://form.asana.com/?k=uvp-HPgd3_hyoXRBw1IcNg&d=1152665201300829
*/

import React from "react";

export const WDayLast = ({ className }) => {
  return (
    <div className={`relative w-[900px] h-[199px] ${className}`}>
      <div className="absolute w-[878px] h-[72px] -top-px left-[13px]">
        <div className="absolute w-[878px] h-[72px] top-0 left-0">
          <div className="absolute w-[45px] h-[45px] top-[3px] left-0 bg-[#fbb5b5] rounded-[22.5px]" />

          <div className="absolute w-[345px] h-[69px] top-[3px] left-[527px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-[15px] text-right tracking-[0] leading-[normal]">
            {""}
          </div>

          <div className="absolute h-[31px] top-0 left-[205px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-xl tracking-[0] leading-[normal]">
            {""}
          </div>

          <div className="absolute w-[146px] h-[47px] top-px left-[59px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-[28px] tracking-[0] leading-[normal]">
            day-name
          </div>
        </div>

        <div className="absolute w-[45px] top-0.5 left-0 [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-2xl text-center tracking-[0] leading-[normal]">
          #
        </div>
      </div>

      <div className="absolute w-[870px] h-[90px] top-[78px] left-[15px]">
        <img
          className="top-[89px] absolute w-[870px] h-px left-0 object-cover"
          alt="W l input line"
          src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-28.svg"
        />

        <img
          className="top-[59px] absolute w-[870px] h-px left-0 object-cover"
          alt="W l input line"
          src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-31.svg"
        />

        <img
          className="top-[29px] absolute w-[870px] h-px left-0 object-cover"
          alt="W l input line"
          src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-30.svg"
        />

        <img
          className="-top-px absolute w-[870px] h-px left-0 object-cover"
          alt="W l input line"
          src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-31.svg"
        />
      </div>
    </div>
  );
};
