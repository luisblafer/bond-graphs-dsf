%% DESCARGA DE METADATOS Y PARAMETROS DE VISUALIZACION CONTROLADOR PD
% SE IMPORTAN Y DESACARGAN DESDE UNA PLANILLA DE GOOGLE DRIVE LOS
% PARÁMETROS DE VISUALIZACIÓN DE LOS ENSAYOS DEL CONTROLADOR PD PARA EL
% MANIPULADOR RR.
%
%       ENSAYOS: PD_ENSAYO_1 ... PD_ENSAYO_6
%
% LOS ARCHIVOS SE EXPORTAN EN FORMATO .CSV A UN DIRECTORIO DENTRO DE
% NUESTRO ESPACIO DE TRABAJO.


% LIMPIAMOS EL WORKSPACE
clc
clear all
close all

% CREAMOS UN ITERADOR PARA LOS ENSAYOS 1-6
numeral = [1:1:6];

% CREAMOS LAS CADENAS PARA ACCEDER A LAS HOJAS DE LA PLANILLA
for k=1:length(numeral)
    ensayosStr{k} = sprintf('PD_ensayo_%d',k);
end


%% IMPORTAR Y GUARDAR LOS ARCHIVOS CON LOS METADATOS DE ENSAYO
for k=1:numel(ensayosStr)
    ensayoChosen = ensayosStr{k};

    ID = '1hWIw55gWxBWk0H8KLxsIQ-wE6Z3xuUrWrV-vbDQVzTY';
    sheet_name = sprintf('%s',ensayoChosen);
    url_name = sprintf('https://docs.google.com/spreadsheets/d/%s/gviz/tq?tqx=out:csv&sheet=%s',...
        ID, sheet_name);
    filename = sprintf('input/metadatos/%s.csv',ensayoChosen);
    outfilename = websave(filename,url_name);
end


%% IMPORTAR Y GUARDAR LOS ARCHIVOS CON LOS PARAMETROS DE VISUALIZACION
for k=1:numel(ensayosStr)
    ensayoChosen = ensayosStr{k};

    ID = '1uhsqYumFVmRld3CQM0kYTciNADOFNiIYNXRjTt7j3Bs';
    sheet_name = sprintf('%s',ensayoChosen);
    url_name = sprintf('https://docs.google.com/spreadsheets/d/%s/gviz/tq?tqx=out:csv&sheet=%s',...
        ID, sheet_name);
    filename = sprintf('input/parametros/%s.csv',ensayoChosen);
    outfilename = websave(filename,url_name);
end
