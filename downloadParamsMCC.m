%% DESCARGA DE PARAMETROS DE VISUALIZACION DE ENSAYOS PARA MCC-IP
% SE IMPORTAN Y DESACARGAN DESDE UNA PLANILLA DE GOOGLE DRIVE LOS
% PARÁMETROS DE VISUALIZACIÓN DE LOS ENSAYOS DEL MCC-IP
%
%       ENSAYOS: ENSAYO_1 ... ENSAYO_11
%
% LOS ARCHIVOS SE EXPORTAN EN FORMATO .CSV A UN DIRECTORIO DENTRO DE
% NUESTRO ESPACIO DE TRABAJO.


% LIMPIAMOS EL WORKSPACE
clc
clear all
close all

% CREAMOS UN ITERADOR PARA LOS ENSAYOS 1-11
numeral = [1:1:11];

% CREAMOS LAS CADENAS PARA ACCEDER A LAS HOJAS DE LA PLANILLA
for k=1:length(numeral)
    ensayosStr{k} = sprintf('ensayo_%d',k);
end


%% IMPORTAR Y GUARDAR LOS ARCHIVOS CON LOS PARAMETROS DE VISUALIZACION
for k=1:numel(ensayosStr)
    ensayoChosen = ensayosStr{k};

    ID = '1D8VxwQbCsWwQ45n6aWQXjx5zKj60zL0Fx20ySe1G8Ms';
    sheet_name = sprintf('%s',ensayoChosen);
    url_name = sprintf('https://docs.google.com/spreadsheets/d/%s/gviz/tq?tqx=out:csv&sheet=%s',...
        ID, sheet_name);
    filename = sprintf('input/parametros/%s.csv',ensayoChosen);
    outfilename = websave(filename,url_name);
end

%ParametrosEnsayo = importfileParametros(outfilename, [2, Inf]);