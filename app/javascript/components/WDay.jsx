/*
We're constantly improving the code you see. 
Please share your feedback here: https://form.asana.com/?k=uvp-HPgd3_hyoXRBw1IcNg&d=1152665201300829
*/

import React from "react";

export const WDay = ({ className }) => {
  return (
    <div className={`w-[900px] h-[199px] ${className}`}>
      <div className="relative w-[902px] h-[200px] -top-px">
        <div className="absolute w-[878px] h-[72px] top-0 left-[15px]">
          <div className="absolute w-[45px] h-[45px] top-[3px] left-0 bg-[#fbb5b5] rounded-[22.5px]">
            <div className="absolute w-[45px] top-0 left-0 [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-2xl text-center tracking-[0] leading-[normal]">
              #
            </div>
          </div>

          <div className="absolute w-[146px] h-[47px] top-px left-[59px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-[28px] tracking-[0] leading-[normal]">
            day-name
          </div>

          <p className="absolute w-[345px] h-[69px] top-[3px] left-[525px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-transparent text-[15px] text-right tracking-[0] leading-[normal]">
            <span className="text-black">Holiday</span>

            <span className="text-black">&nbsp;</span>

            <span className="text-black">
              box
              <br />
            </span>

            <span className="text-black">
              <br />
            </span>
          </p>

          <div className="absolute h-[31px] top-0 left-[205px] [font-family:'Aref_Ruqaa',Helvetica] font-normal text-black text-xl tracking-[0] leading-[normal]">
            {""}
          </div>
        </div>

        <div className="absolute w-[902px] h-[147px] top-[53px] left-0">
          <img
            className="absolute w-[900px] h-0.5 top-[145px] left-0"
            alt="W l divider line"
            src="https://c.animaapp.com/eFfbxFd7/img/w-l-divider-line-5.svg"
          />

          <div className="absolute w-[870px] h-[145px] top-0 left-[15px]">
            <img
              className="top-[115px] absolute w-[870px] h-px left-0 object-cover"
              alt="W l input line"
              src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-28.svg"
            />

            <img
              className="top-[85px] absolute w-[870px] h-px left-0 object-cover"
              alt="W l input line"
              src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-31.svg"
            />

            <img
              className="top-[55px] absolute w-[870px] h-px left-0 object-cover"
              alt="W l input line"
              src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-30.svg"
            />

            <img
              className="top-[25px] absolute w-[870px] h-px left-0 object-cover"
              alt="W l input line"
              src="https://c.animaapp.com/eFfbxFd7/img/w-l-input-line-31.svg"
            />

            <textarea className="absolute w-[870px] h-[145px] top-0 left-0 bg-transparent [font-family:'Aref_Ruqaa',Helvetica] font-normal text-transparent text-xl tracking-[0] leading-[30px] border-0 p-0"></textarea>
          </div>
        </div>
      </div>
    </div>
  );
};
