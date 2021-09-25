function [w_rpe,Ia_rpe] = stateRpe(Ua_rpe,Tc_rpe,s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
w_rpe = ((s.Km)/(s.b*s.Ra+s.Km^2)) * Ua_rpe - ((s.Ra)/(s.b*s.Ra+s.Km^2)) * Tc_rpe;
Ia_rpe = ((s.b)/(s.b*s.Ra+s.Km^2)) * Ua_rpe + ((s.Km)/(s.b*s.Ra+s.Km^2)) * Tc_rpe;
end

