function ParametrosEnsayos = importfileParametros(filename, dataLines)
%IMPORTFILEPARAMETROS Import data from a text file
%  PARAMETROSENSAYOS = IMPORTFILEPARAMETROS(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  PARAMETROSENSAYOS = IMPORTFILEPARAMETROS(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  ParametrosEnsayos = importfileParametros("/Users/luis/Documents/MATLAB/BG/Parametros - Hoja 1.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Aug-2021 01:08:08

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 13);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Variable", "FigureName", "LegendText", "LineColor", "LineWidth", "XLabelText", "YLabelText", "Interpreter", "XLimSpan", "YLimSpan", "YTick", "LegendLocation", "XLineCoordinates"];
opts.VariableTypes = ["char", "char", "char", "char", "double", "char", "char", "char", "string", "string", "string", "char", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Variable", "FigureName", "LegendText", "LineColor", "XLabelText", "YLabelText", "Interpreter", "XLimSpan", "YLimSpan", "YTick", "LegendLocation", "XLineCoordinates"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Variable", "FigureName", "LegendText", "LineColor", "XLabelText", "YLabelText", "Interpreter", "XLimSpan", "YLimSpan", "YTick", "LegendLocation", "XLineCoordinates"], "EmptyFieldRule", "auto");

% Import the data
ParametrosEnsayos = readtable(filename, opts);

end